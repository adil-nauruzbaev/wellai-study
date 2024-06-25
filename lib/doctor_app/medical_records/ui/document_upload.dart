import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../shared/app_assets.dart';
import '../../../shared/l10n/l10n_helper.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import 'category_screen.dart';
import 'records_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({required this.file, super.key});
  final PlatformFile file;
  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  DateTime now = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _date = TextEditingController();

  var categoryText = '';
  var contDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      _date.text = DateFormat('yyyy/MM/dd').format(picked);
      contDate = DateFormat('yyyy/MM/dd').format(picked);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final containerWidth = widthScreen * 0.4426;
    final file = widget.file;
    var fileName = file.name;
    if (fileName.length >= 12) {
      final ext = fileName.substring(fileName.length - 3);
      fileName = '${fileName.substring(0, 12)}...$ext';
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          context.s.documentUpload,
          style: context.text.s18w500,
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28, bottom: 12),
                      child:
                          Text(context.s.document, style: context.text.s18w500),
                    ),
                    Container(
                      width: containerWidth,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.color.backgroundGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(
                                image:
                                    AssetImage(CoreAssets.images.avatarAsset),
                                width: 48,
                                height: 48,
                              ),
                            ),
                            categoryText != ''
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, bottom: 8),
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
                                        categoryText,
                                        style: context.text.s10w600.copyWith(
                                          color: context.color.outlineButton,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 5),
                              child: Text(
                                contDate,
                                style: context.text.s10w500,
                              ),
                            ),
                            Text(
                              fileName,
                              style: context.text.s12w400,
                              maxLines: 2,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 12),
                      child: Text(context.s.title, style: context.text.s18w500),
                    ),
                    TextFormField(
                      style: context.text.s14w400
                          .copyWith(color: context.color.greyText),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: context.color.background,
                        hintText: 'Thyroid hormone',
                        hintStyle: context.text.s14w400
                            .copyWith(color: context.color.greyText),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: context.color.grey700),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: context.color.grey700),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            value.length < 8 ||
                            value.length > 16) {
                          return ' ';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 12),
                      child: Text(
                        context.s.category,
                        style: context.text.s18w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        categoryText = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryScreen(),
                          ),
                        );
                        setState(() {});
                        _category.text = categoryText;
                      },
                      child: TextFormField(
                        controller: _category,
                        enabled: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: context.color.background,
                          hintText: context.s.chooseCategory,
                          hintStyle: context.text.s14w400
                              .copyWith(color: context.color.greyText),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: context.color.grey700),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: SvgPicture.asset(
                              CoreAssets.svg.iArrowRight,
                              colorFilter: ColorFilter.mode(
                                context.color.buttonGreen,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ' ';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 12),
                      child: Text(
                        context.s.date,
                        style: context.text.s18w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        _selectDate(context);
                      },
                      child: TextFormField(
                        controller: _date,
                        enabled: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: context.color.background,
                          hintText: context.s.MMDDYYYY,
                          hintStyle: context.text.s14w400
                              .copyWith(color: context.color.greyText),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: context.color.grey700),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 32,
              ),
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
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RecordsScreen()));
                        }
                      },
                      style: context.button.elevated1,
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
        ),
      ),
    );
  }
}
