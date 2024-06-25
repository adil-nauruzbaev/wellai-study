import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../../../shared/init/core_d_i.dart';
import '../../../../../../shared/l10n/source/local_storage.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';
import 'bottom_sheet/bottom_no_photo.dart';
import '../../../../../../shared/app_assets.dart';

class AppBarrPI extends StatefulWidget {
  const AppBarrPI({
    super.key,
    this.imagePath,
  });
  final String? imagePath;

  @override
  State<AppBarrPI> createState() => _AppBarrPIState();
}

class _AppBarrPIState extends State<AppBarrPI> {
  late ImageProvider _imageProvider;
  bool _isDefaultImage = true;

  @override
  void initState() {
    super.initState();
    _setImageProvider();
  }

  void _setImageProvider() {
    if (widget.imagePath != null) {
      final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
      final token = '${CoreDi.get<LocalStorage>().read('token')}';
      _imageProvider = CachedNetworkImageProvider(
        '${baseUrl.substring(
          0,
          baseUrl.length - 1,
        )}${widget.imagePath ?? ''}',
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      _isDefaultImage = false;
    } else {
      _imageProvider = AssetImage(
        CoreAssets.images.avatarAsset,
      );
      _isDefaultImage = true;
    }
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.isNotEmpty && result.files.single.path != null) {
      setState(() {
        _imageProvider = FileImage(
          File(result.files.single.path!),
        );
        _isDefaultImage = false;
      });
    }
  }

  Future<String?> showPhotoBottomSheet(BuildContext context) {
    return showModalBottomSheet<String?>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ChoosePhoto(
        pickImage: _pickImage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.imagePath);
    return InkWell(
      onTap: () async {
        final result = await showPhotoBottomSheet(context);
        if (result != null) {
          setState(() {
            _imageProvider = FileImage(
              File(result),
            );
            _isDefaultImage = false;
          });
        }
      },
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 75),
            CircleAvatar(
              radius: 60,
              backgroundImage: _imageProvider,
            ),
            const SizedBox(height: 10),
            Text(
              _isDefaultImage ? context.s.setPhoto : context.s.editPhoto,
              style: context.text.ga16w6000,
            ),
          ],
        ),
      ),
    );
  }
}
