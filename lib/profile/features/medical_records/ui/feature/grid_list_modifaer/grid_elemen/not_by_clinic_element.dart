import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../shared/app_assets.dart';
import '../../../../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../../../../shared/init/core_d_i.dart';
import '../../../../../../../shared/l10n/source/local_storage.dart';
import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../data/bloc/documents_model_bloc/bloc.dart';
import '../../../../data/dto/documents_dto.dart';
import '../../../../data/dto/filter.dart';
import '../../../widgets/document_actions/alert_document_actions.dart';

class NotByClinicElement extends StatelessWidget {
  const NotByClinicElement({
    required this.documentItem,
    // required this.currentFilter,
    // required this.onDocumentAction,
    super.key,
    required this.currentFilter,
  });
  final DocumentResponceDto documentItem;
  final FilterDTO currentFilter;
  // final Function(FilterDTO filterDTO) onDocumentAction;

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
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.color.background,
          ),
          child: IconButton(
            onPressed: () async {
              final documentActions = await showDocumentAction(
                context,

                //
              );
              if (documentActions != null) {
                switch (documentActions) {
                  case 2:
                    CoreDi.get<DocumentlBloc>().add(DeleteDocument(
                      documentItem.id ?? 0,
                      currentFilter,
                    ));

                    break;
                  default:
                }
                ;
              }
              print('🏐 sortType : ${documentActions}');
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
      ],
    );
  }
}
