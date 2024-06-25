import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import '../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../shared/init/core_d_i.dart';
import '../../../../shared/l10n/source/local_storage.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../data/dto_home/stories_response.dart';

class FullScreenStoriesElement extends StatelessWidget {
  const FullScreenStoriesElement({
    required this.data,
    super.key,
  });
  final StoriesResponseDto data;
  @override
  Widget build(BuildContext context) {
    final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
    final token = '${CoreDi.get<LocalStorage>().read('token')}';
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: '${baseUrl.substring(
            0,
            baseUrl.length - 1,
          )}${data.image?.path ?? ''}',
          httpHeaders: {
            'Authorization': 'Bearer $token',
          },
          fit: BoxFit.cover,
          placeholder: (context, _) {
            return BlurHash(
              hash: data.image?.blur ?? '',
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
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      data.title ?? '',
                      style: context.text.m32w400,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.description ?? '',
                      style: context.text.n14w400,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: context.button.elevated3,
                            onPressed: () {},
                            child: const Text(
                              'Example',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
