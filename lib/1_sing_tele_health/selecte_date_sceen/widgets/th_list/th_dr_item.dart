import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import '../../../../shared/app_assets.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../shared/init/core_d_i.dart';
import '../../../../shared/l10n/source/local_storage.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../data/work_th_dto.dart';

class THDrItem extends StatelessWidget {
  const THDrItem({
    required this.appointment,
    super.key,
  });
  final WorkTimeDTO appointment;

  @override
  Widget build(BuildContext context) {
    final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
    final token = '${CoreDi.get<LocalStorage>().read('token')}';

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.color.backgroundGrey,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 0, 8),
              child: Row(
                children: [
                  if (appointment.work?.user?.profile?.image?.name != null)
                    // const SizedBox.shrink()
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      height: 28,
                      width: 28,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(3),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: '${baseUrl.substring(
                            0,
                            baseUrl.length - 1,
                          )}${appointment.work?.user?.profile?.image?.name ?? ''}',
                          httpHeaders: {
                            'Authorization': 'Bearer $token',
                          },
                          fit: BoxFit.cover,
                          placeholder: (context, _) {
                            return BlurHash(
                              hash: appointment.work?.user?.profile?.image?.blur ?? '',
                            );
                          },
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    CircleAvatar(
                      radius: 14,
                      child: Image.asset(CoreAssets.images.avatarAsset),
                    ),
                  const SizedBox(width: 4),
                  Text(
                    ' ${appointment.work?.user?.profile?.firstName ?? ''}  ${appointment.work?.user?.profile?.lastName ?? ''}',
                    style: context.text.gs16w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: context.button.outline3,
                      onPressed: () {},
                      child: Text(context.s.chooseThisDoctor),
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
