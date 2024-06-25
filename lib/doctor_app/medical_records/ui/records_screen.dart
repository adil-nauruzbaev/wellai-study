import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../shared/app_assets.dart';
import '../../../shared/data/root_gateway/root_gateway.dart';
import '../../../shared/init/core_d_i.dart';
import '../../../shared/l10n/l10n_helper.dart';
import '../../../shared/l10n/source/local_storage.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '../data/bloc/documents/documents_bloc.dart';
import '../data/dto/documents_model.dart';
import '../data/dto/filter_model.dart';
import 'document_upload.dart';
import 'filter_screen.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  FilterModel filter = FilterModel(categoriesList: []);
  int sorted = 0;
  @override
  void initState() {
    CoreDi.get<DocumentsDocBloc>().add(
      DocumentsFetch(
        sort: sorted,
        categories: filter.categoriesList,
        start: filter.startDate,
        end: filter.endDate,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      appBar: AppBar(
        backgroundColor: context.color.background,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: context.color.textPrimary,
              size: 32,
            ),
          ),
        ),
        leadingWidth: 50,
        title: Text(
          context.s.medicalRecords,
          style: context.text.s18w500,
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: BlocBuilder(
        bloc: CoreDi.get<DocumentsDocBloc>(),
        builder: (context, state) {
          if (state is DocumentsInitial) {
            return const SizedBox.shrink();
          }
          if (state is DocumentsLoading) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            );
          }
          if (state is DocumentsError) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.s.errorLoadingCalendar),
              ],
            );
          }
          if (state is DocumentsData) {
            final documents = state.data;
            if (documents.isEmpty) {
              return const RecordsEmpty();
            } else {
              print(sorted);
              return RecordsList(
                filter: filter,
                list: documents,
                sorted: sorted,
                onSortChanged: (int newSort) {
                  setState(() {
                    sorted = newSort;
                  });
                },
                onFilterChanged: (FilterModel newFilter) {
                  setState(() {
                    filter = newFilter;
                  });
                },
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class RecordsEmpty extends StatelessWidget {
  const RecordsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SvgPicture.asset(CoreAssets.svg.imgEmptyDocumentList),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 28),
                  child: Text(
                    context.s.youDoNotHaveAnyUploadedDocumentsRightNow,
                    style: context.text.s14w400
                        .copyWith(color: context.color.grayscaleDarkGray),
                    maxLines: 2,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
          decoration: BoxDecoration(
            color: context.color.background,
            boxShadow: [
              BoxShadow(
                color: context.color.shadow.withOpacity(0.08),
                offset: const Offset(
                  0,
                  -2,
                ),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: context.button.elevated3,
                  child: Text(
                    context.s.uploadNewDocument,
                    style: context.text.s16w600
                        .copyWith(color: context.color.background),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RecordsList extends StatelessWidget {
  RecordsList(
      {required this.list,
      required this.filter,
      required this.sorted,
      required this.onFilterChanged,
      required this.onSortChanged,
      super.key});
  final List<DocumentsModel> list;
  FilterModel filter;
  int sorted;
  final ValueChanged<int> onSortChanged;
  final ValueChanged<FilterModel> onFilterChanged;
  final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
  final token = '${CoreDi.get<LocalStorage>().read('token')}';
  String cutFileString(String file) {
    if (file.length >= 12) {
      final ext = file.substring(file.length - 3);
      file = '${file.substring(0, 12)}...$ext';
    }
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 12),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: context.s.search,
                      hintStyle: context.text.s16w400
                          .copyWith(color: context.color.greyText),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: context.color.grey300,
                      ),
                      filled: true,
                      fillColor: context.color.backgroundGrey,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: context.color.backgroundGrey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: context.color.backgroundGrey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final newFilter = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilterScreen(filter: filter),
                    ),
                  );
                  if (newFilter != null) {
                    filter = newFilter;
                    onFilterChanged(newFilter);
                  }
                  CoreDi.get<DocumentsDocBloc>().add(
                    DocumentsFetch(
                      sort: sorted,
                      start: filter.startDate,
                      end: filter.endDate,
                      categories: filter.categoriesList,
                    ),
                  );
                  print(filter.categoriesList[0]);
                },
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    SvgPicture.asset(
                      CoreAssets.svg.iFilter,
                      colorFilter: ColorFilter.mode(
                        context.color.textPrimary,
                        BlendMode.srcIn,
                      ),
                      width: 28,
                      height: 28,
                    ),
                    filter.categoriesList.isNotEmpty ||
                            filter.startDate != null ||
                            filter.endDate != null
                        ? SvgPicture.asset(
                            CoreAssets.svg.newNotificatorIndicator,
                            colorFilter: ColorFilter.mode(
                              context.color.outlineButton,
                              BlendMode.srcIn,
                            ),
                            width: 8,
                            height: 8,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 16),
                child: GestureDetector(
                  onTap: () async {
                    final newSort = await showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: context.color.background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 16),
                                    child: Text(
                                      context.s.sortDocuments,
                                      style: context.text.s12w500.copyWith(
                                        color: context.color.greyText,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: context.color.borderGrey,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (sorted != 2) {
                                        sorted = 2;
                                        CoreDi.get<DocumentsDocBloc>().add(
                                          DocumentsFetch(
                                            sort: sorted,
                                            categories: filter.categoriesList,
                                            start: filter.startDate,
                                            end: filter.endDate,
                                          ),
                                        );
                                      }

                                      Navigator.pop(context, sorted);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, bottom: 16),
                                      child: Text(context.s.newDocumentsFirst,
                                          style: context.text.s16w400),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: context.color.borderGrey,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (sorted != 1) {
                                        sorted = 1;
                                        CoreDi.get<DocumentsDocBloc>().add(
                                            DocumentsFetch(
                                                sort: sorted,
                                                categories:
                                                    filter.categoriesList,
                                                start: filter.startDate,
                                                end: filter.endDate));
                                      }

                                      Navigator.pop(context, sorted);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, bottom: 16),
                                      child: Text(context.s.oldDocumentsFirst,
                                          style: context.text.s16w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 8,
                                  bottom: 28,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: context.color.background,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, bottom: 16),
                                  child: Text(context.s.cancel,
                                      style: context.text.s16w600),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                    if (newSort != null) {
                      onSortChanged(newSort);
                    }
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      SvgPicture.asset(
                        CoreAssets.svg.iSorte,
                        colorFilter: ColorFilter.mode(
                          context.color.textPrimary,
                          BlendMode.srcIn,
                        ),
                        width: 28,
                        height: 28,
                      ),
                      sorted != 0
                          ? SvgPicture.asset(
                              CoreAssets.svg.newNotificatorIndicator,
                              colorFilter: ColorFilter.mode(
                                context.color.outlineButton,
                                BlendMode.srcIn,
                              ),
                              width: 8,
                              height: 8,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 6),
            child: GridView.builder(
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context.color.backgroundGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(
                                imageUrl: '${baseUrl.substring(
                                  0,
                                  baseUrl.length - 1,
                                )}${list[index].user?.profile?.image?.path ?? ''}',
                                httpHeaders: {
                                  'Authorization': 'Bearer $token',
                                },
                                fit: BoxFit.cover,
                                placeholder: (context, _) {
                                  return BlurHash(
                                    hash: list[index]
                                            .user
                                            ?.profile
                                            ?.image
                                            ?.blur ??
                                        '',
                                  );
                                },
                                width: 48,
                                height: 48,
                              ),
                            ),
                            GestureDetector(
                                onTap: () async {
                                  await showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      builder: (BuildContext context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 16, right: 16),
                                              padding: const EdgeInsets.only(
                                                  top: 12, bottom: 18),
                                              decoration: BoxDecoration(
                                                color: context.color.background,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 16),
                                                    child: Text(
                                                      context.s.documentActions,
                                                      style: context
                                                          .text.s12w500
                                                          .copyWith(
                                                        color: context
                                                            .color.greyText,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 1.5,
                                                    thickness: 1,
                                                    color: context
                                                        .color.borderGrey,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 16,
                                                      bottom: 16,
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        context.s.share,
                                                        style: context
                                                            .text.s16w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 1.5,
                                                    thickness: 1,
                                                    color: context
                                                        .color.borderGrey,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 16,
                                                      bottom: 16,
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        context.s.edit,
                                                        style: context
                                                            .text.s16w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 1.5,
                                                    thickness: 1,
                                                    color: context
                                                        .color.borderGrey,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        if (list[index].id !=
                                                            null) {
                                                          CoreDi.get<
                                                                  DocumentsDocBloc>()
                                                              .add(
                                                                  DocumentsDelete(
                                                            id: list[index].id!,
                                                            sort: sorted,
                                                            categories: filter
                                                                .categoriesList,
                                                            start: filter
                                                                .startDate,
                                                            end: filter.endDate,
                                                          ));
                                                        }
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        context.s.delete,
                                                        style: context
                                                            .text.s16w400
                                                            .copyWith(
                                                          color: context
                                                              .color.error,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 28, top: 8),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16, bottom: 16),
                                                  margin: const EdgeInsets.only(
                                                      left: 16, right: 16),
                                                  decoration: BoxDecoration(
                                                    color: context
                                                        .color.background,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Text(context.s.cancel,
                                                      style:
                                                          context.text.s16w600),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: SvgPicture.asset(CoreAssets.svg.i3dots)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 8),
                          child: Container(
                            padding: const EdgeInsets.only(
                              right: 8,
                              left: 8,
                              top: 3,
                              bottom: 3,
                            ),
                            decoration: BoxDecoration(
                              color: context.color.backgroundGrey,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: context.color.outlineButton,
                              ),
                            ),
                            child: Text(
                              list[index].category?.name ?? '',
                              style: context.text.s10w600.copyWith(
                                color: context.color.outlineButton,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          list[index].dateOfEvent != null
                              ? DateFormat('yyyy/MM/dd')
                                  .format(list[index].dateOfEvent!)
                              : '????/??/??',
                          style: context.text.s10w600
                              .copyWith(color: context.color.shadow),
                        ),
                        Text(
                          list[index].header ?? '',
                          style: context.text.s12w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          list[index].files?.isEmpty == false
                              ? cutFileString(
                                  list[index].files?[0].name != null
                                      ? list[index].files![0].name!
                                      : '',
                                )
                              : '',
                          style: context.text.s12w400.copyWith(height: 1.5),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
          decoration: BoxDecoration(
            color: context.color.background,
            boxShadow: [
              BoxShadow(
                color: context.color.shadow.withOpacity(0.08),
                offset: const Offset(
                  0,
                  -2,
                ),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final resultPick = await FilePicker.platform.pickFiles();
                    if (resultPick != null) {
                      final file = resultPick.files.first;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadScreen(
                            file: file,
                          ),
                        ),
                      );
                    } else {}
                  },
                  style: context.button.elevated3,
                  child: Text(
                    context.s.uploadNewDocument,
                    style: context.text.s16w600
                        .copyWith(color: context.color.background),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//edit bottomshhet
/*showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 16, right: 16),
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 18),
                                decoration: BoxDecoration(
                                  color: context.color.background,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: Text(
                                        context.s.documentActions,
                                        style: context.text.s12w500.copyWith(
                                          color: context.color.greyText,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 1.5,
                                      thickness: 1,
                                      color: context.color.borderGrey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 16,
                                        bottom: 16,
                                      ),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          context.s.share,
                                          style: context.text.s16w400,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 1.5,
                                      thickness: 1,
                                      color: context.color.borderGrey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 16,
                                        bottom: 16,
                                      ),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          context.s.edit,
                                          style: context.text.s16w400,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 1.5,
                                      thickness: 1,
                                      color: context.color.borderGrey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          context.s.delete,
                                          style: context.text.s16w400.copyWith(
                                            color: context.color.error,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 28, top: 8),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 16, bottom: 16),
                                  margin: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  decoration: BoxDecoration(
                                    color: context.color.background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(context.s.cancel,
                                      style: context.text.s16w600),
                                ),
                              ),
                            ],
                          );
                        }); */
