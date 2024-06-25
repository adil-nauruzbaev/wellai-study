import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import '../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../shared/init/core_d_i.dart';
import '../../../../shared/l10n/source/local_storage.dart';
import '../data/dto/profile_info_dto.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({
    required this.profileInfoDTO,
    super.key,
  });
  final ProfileInfoDTO profileInfoDTO;

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
    final token = '${CoreDi.get<LocalStorage>().read('token')}';
    final profileInfoDTO = widget.profileInfoDTO;
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.purple],
              ),
            ),
            height: 104,
            width: 104,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              height: 104,
              width: 104,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(3),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: '${baseUrl.substring(
                    0,
                    baseUrl.length - 1,
                  )}${profileInfoDTO.profile?.image?.path ?? ''}',
                  httpHeaders: {
                    'Authorization': 'Bearer $token',
                  },
                  fit: BoxFit.cover,
                  placeholder: (context, _) {
                    return BlurHash(
                      hash: profileInfoDTO.profile?.image?.blur ?? '',
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
            ),
          ),
        ],
      ),
    );
  }
}
