import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../../shared/init/core_d_i.dart';
import '../../../../../../shared/l10n/generated/l10n.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import '../../../../../../shared/widgets/text_fields/date_time_textfield.dart';
import '/shared/l10n/l10n_helper.dart';

import 'data/bloc/bloc.dart';
import 'data/post_documents_dto.dart';
import 'widgets/dialog_document_successfull_uploaded.dart';
import 'widgets/file_categori_field.dart';
import '../grid_list_modifaer/grid_elemen/small_grid_element.dart';

class DocumentUploadScreen extends StatefulWidget {
  const DocumentUploadScreen({
    required this.uploadTime,
    required this.filePath,
    super.key,
  });
  final String? filePath;
  final DateTime uploadTime;

  @override
  State<DocumentUploadScreen> createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  int? selectedCategoryId;
  final titleField = AppTextfield(
    data: AppTextfieldData(
      hintText: S.current.title2,
    ),
  );
  DateTime? dateOfEvent;
  late final DateTimeTextfield dateField;
  //  DateTimeTextfield(data: DateTimeTextfieldData(
  //   onChanged: (p0) {
  //     dateOfEvent = p0;
  //   },
  // ));
  @override
  void initState() {
    dateField = DateTimeTextfield(
      data: DateTimeTextfieldData(
        onChanged: (p0) {
          dateOfEvent = p0;
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final uploadTimeFormatted = DateFormat('yyyy-MM-dd -kk:mm').format(widget.uploadTime);

    return BlocConsumer<FilesPickerBloc, FilesPickerState>(
      // buildWhen: ,
      listener: (BuildContext context, FilesPickerState state) {
        if (state is FilesPickerSucces) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const DialogDocumentSuccesfullUploaded();
            },
          );
        }
      },
      bloc: CoreDi.get<FilesPickerBloc>(),
      builder: (context, state) {
        if (state is FilesPickerLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight + 20.0),
            child: AppBar(
              title: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                child: Text(
                  context.s.documentUpload,
                  style: context.text.m18w400,
                ),
              ),
              centerTitle: true,
              elevation: 1,
              automaticallyImplyLeading: false,
              backgroundColor: context.color.background,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: context.color.shadow,
                  size: 32,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    const SizedBox(height: 28),
                    Text(
                      context.s.document,
                      style: context.text.m18w400,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SmallGridElement(
                        filePath: widget.filePath,
                        uploadTime: uploadTimeFormatted,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                      child: Text(
                        context.s.title,
                        style: context.text.m18w400,
                      ),
                    ),
                    titleField,
                    const SizedBox(height: 24),
                    Text(
                      context.s.category,
                      style: context.text.m18w400,
                    ),
                    const SizedBox(height: 12),
                    CategoryTextField(
                      onCheange: (categoryDto) {
                        selectedCategoryId = categoryDto.id;
                      },
                    ),
                    const SizedBox(height: 24),
                    Text(
                      context.s.date,
                      style: context.text.m18w400,
                    ),
                    const SizedBox(height: 12),
                    dateField,
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.color.background,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 8,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: context.button.elevated3,
                        onPressed: () {
                          final postDocumentDto = PostDocumentsDto(
                            hader: titleField.data.controller.text,
                            categoryId: selectedCategoryId,
                            dateOfEvent: dateOfEvent,
                            // dateOfEvent: DateTime.parse(dateField.data.controller.text), //DateFormat('yyyy-MM-dd').parse(dateField.data.controller.text),
                            file: widget.filePath,
                          );

                          CoreDi.get<FilesPickerBloc>().add(CreateDocument(postDocumentDto));
                        },
                        child: Text(
                          context.s.okay,
                          style: context.text.n16w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
