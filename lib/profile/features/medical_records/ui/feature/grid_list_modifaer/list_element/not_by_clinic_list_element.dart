import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../shared/app_assets.dart';
import '../../../../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../../../../shared/init/core_d_i.dart';
import '../../../../../../../shared/l10n/source/local_storage.dart';
import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../data/dto/documents_dto.dart';

class NotByClinicListElement extends StatelessWidget {
  const NotByClinicListElement({
    required this.documentItem,
    super.key,
  });

  final DocumentResponceDto documentItem;

  @override
  Widget build(BuildContext context) {
    final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
    final token = '${CoreDi.get<LocalStorage>().read('token')}';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          height: 40,
          width: 40,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: '${baseUrl.substring(
                0,
                baseUrl.length - 1,
              )}${documentItem.user?.profile?.image?.path ?? ''}',
              httpHeaders: {
                'Authorization': 'Bearer $token',
              },
              fit: BoxFit.cover,
              placeholder: (context, _) {
                return BlurHash(
                  hash: documentItem.user?.profile?.image?.blur ?? '',
                );
              },
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
                  CoreAssets.svg.i3dots,
                  // colorFilter: ColorFilter.mode(
                  //   context.color.accent,
                  //   BlendMode.srcIn,
                  // ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
