import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../shared/app_assets.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';

class ImagePickerTH extends StatefulWidget {
  const ImagePickerTH({super.key});

  @override
  State<ImagePickerTH> createState() => _ImagePickerTHState();
}

class _ImagePickerTHState extends State<ImagePickerTH> {
  final List<String> _filePaths = [];

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _filePaths.addAll(result.paths.whereType<String>());
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _filePaths.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width ~/ 110;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: _filePaths.length + 1,
      itemBuilder: (context, index) {
        // Кнопка добавления изображения
        if (index == _filePaths.length) {
          return InkWell(
            onTap: _pickImage,
            child: DottedBorder(
              radius: const Radius.circular(12),
              borderType: BorderType.RRect,
              dashPattern: const [10, 6],
              color: context.color.accent,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        height: 11,
                        CoreAssets.svg.iPus,
                        colorFilter: ColorFilter.mode(
                          context.color.accent,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        context.s.addPhotoOr,
                        style: context.text.g10w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        // Изображение с кнопкой удаления
        final path = _filePaths[index];
        return Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(path)),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            // Кнопка удаления
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.color.background.withOpacity(0.25),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    height: 16,
                    width: 16,
                    CoreAssets.svg.idismiss,
                    color: context.color.shadow,
                  ),
                  onPressed: () => _removeImage(index),
                  padding: const EdgeInsets.all(2),
                  constraints: const BoxConstraints(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
