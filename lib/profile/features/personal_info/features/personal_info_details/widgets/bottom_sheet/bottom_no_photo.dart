// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import 'camera.dart';

Future<String?> showPhotoBottomSheet(BuildContext context, Future<void> Function() pickImage, {String? initialImage}
    // initialImage if(initialImage !=null)
    ) {
  //initialImagi if(initialImagi = null){no boot}elce yes
  return showModalBottomSheet<String?>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => ChoosePhoto(
      pickImage: pickImage,
      initialImage: initialImage,
    ),
  );
}

class ChoosePhoto extends StatelessWidget {
  const ChoosePhoto({
    required this.pickImage,
    super.key,
    this.initialImage,
  });
  final Future<void> Function() pickImage;
  final String? initialImage;
  @override
  Widget build(BuildContext context) {
    final buttonTitles = [
      context.s.takePhoto,
      context.s.choosePhoto,
      context.s.delete,
      context.s.cancel,
    ];

    final buttonStyles = <TextStyle>[
      context.text.bn16w400,
      context.text.bn16w400,
      context.text.bn16w400,
      context.text.ssb16w400,
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    buttonTitles.length * 2 - 1,
                    (index) {
                      if (index.isOdd) {
                        return const Divider(
                          color: Colors.grey,
                        );
                      }

                      final itemIndex = index ~/ 2;
                      return ListTile(
                        title: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            buttonTitles[itemIndex],
                            style: buttonStyles[itemIndex],
                          ),
                        ),
                        onTap: () async {
                          switch (itemIndex) {
                            case 0:
                              final cameras = await availableCameras();

                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CameraPage(cameras: cameras),
                                ),
                              );
                              if (result != null) {
                                Navigator.pop(context, result);
                              }

                              break;
                            case 1:
                              pickImage();
                              break;
                            case 2:
                              // if(initial != null){deletbut}
                              break;
                            case 3:
                              Navigator.pop(context);
                              break;
                          }
                        },
                      );
                    },
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
