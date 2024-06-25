import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../shared/app_assets.dart';
import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../data/dto/documents_dto.dart';

class ByClinicListElement extends StatelessWidget {
  const ByClinicListElement({
    required this.documentItem,
    super.key,
  });

  final DocumentResponceDto documentItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.color.background,
          ),
          child: CircleAvatar(
            backgroundColor: context.color.background,
            radius: 16,
            backgroundImage: AssetImage(
              CoreAssets.images.logoLhat,
            ),
          ),
        ),
        const SizedBox(width: 8),
        if (documentItem.files != null)
          ...documentItem.files!.map(
            (file) => Expanded(
              child: Text(
                file.name ?? '',
                style: context.text.sh12w400,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.color.background,
            ),
            child: IconButton(
              onPressed: () async {
                // final sortType = await showSortBottomSheet(context);
                // print('🏐 sortType : ${sortType}');
              },
              icon: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  CoreAssets.svg.iUpload,
                  colorFilter: ColorFilter.mode(
                    context.color.accent,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
