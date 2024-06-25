import 'package:flutter/material.dart';

import '../../../../../../../shared/app_assets.dart';
import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';

class SmallGridElement extends StatefulWidget {
  const SmallGridElement({
    super.key,
    this.uploadTime,
    this.filePath,
  });
  final String? uploadTime;
  final String? filePath;
  @override
  State<SmallGridElement> createState() => _SmallGridElementState();
}

class _SmallGridElementState extends State<SmallGridElement> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 166,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: context.color.backgroundGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.color.notificationsCout,
                  shape: BoxShape.circle,
                ),
                height: 48,
                width: 48,
                child: Image.asset(
                  CoreAssets.images.logoLhat,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(widget.uploadTime ?? 'No date provided', style: context.text.sh12w400),
                  Text(
                    widget.filePath ?? 'No file selected',
                    style: context.text.sh10w400,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
