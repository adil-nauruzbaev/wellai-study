import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../document_upload_screen.dart';
import '/shared/l10n/l10n_helper.dart';

class FilesPicker extends StatefulWidget {
  const FilesPicker({super.key});

  @override
  State<FilesPicker> createState() => _FilesPickerState();
}

class _FilesPickerState extends State<FilesPicker> {
  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      final filePath = result.files.single.path;

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DocumentUploadScreen(
              filePath: filePath,
              uploadTime: DateTime.now(),
            ),
          ),
        );
      }
    } else {
      // ignore: avoid_print
      print('No file selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: context.button.elevated1,
              onPressed: pickFile,
              child: Text(
                context.s.uploadNewDocument,
                style: context.text.n16w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
