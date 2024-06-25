import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../shared/app_assets.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  String? _filePath;

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_filePath == null)
            GestureDetector(
              onTap: _pickImage,
              child: DottedBorder(
                radius: const Radius.circular(12),
                borderType: BorderType.RRect,
                dashPattern: const [10, 6],
                color: context.color.accent,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          CoreAssets.svg.iPus,
                          colorFilter: ColorFilter.mode(
                            context.color.accent,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        context.s.addPhoto,
                        style: context.text.b12w400,
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(_filePath!)),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
