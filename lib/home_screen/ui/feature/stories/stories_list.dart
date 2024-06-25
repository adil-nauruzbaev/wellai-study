import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import '../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../shared/init/core_d_i.dart';
import '../../../../shared/l10n/source/local_storage.dart';
import '../../../../shared/navigator/navigator1_helper.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../data/bloc_stories/stories_bloc.dart';
import 'full_screen_stories.dart';

class StoriesListWidget extends StatefulWidget {
  const StoriesListWidget({super.key});

  @override
  State<StoriesListWidget> createState() => _StoriesListWidgetState();
}

class _StoriesListWidgetState extends State<StoriesListWidget> {
  @override
  void initState() {
    super.initState();
    CoreDi.get<StoriesBloc>().add(FetchStories());
  }

  @override
  Widget build(BuildContext context) {
    final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
    final token = '${CoreDi.get<LocalStorage>().read('token')}';
    return BlocBuilder<StoriesBloc, StoriesState>(
      bloc: CoreDi.get<StoriesBloc>(),
      builder: (context, state) {
        if (state is StoriesLoading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is StoriesData) {
          return SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...state.stories.map(
                    (element) {
                      return GestureDetector(
                        onTap: () {
                          context.rootRouter.use.push(
                            FullScreenStories(
                              storyList: state.stories,
                              initialPage: state.stories.indexOf(element),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Colors.blue, Colors.purple],
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                height: 128,
                                width: 120,
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                height: 126,
                                width: 118,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: CachedNetworkImage(
                                    imageUrl: '${baseUrl.substring(
                                      0,
                                      baseUrl.length - 1,
                                    )}${element.thumbnail?.path ?? ''}',
                                    httpHeaders: {
                                      'Authorization': 'Bearer $token',
                                    },
                                    fit: BoxFit.cover,
                                    placeholder: (context, _) {
                                      return BlurHash(
                                        hash: element.thumbnail?.blur ?? '',
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
                              Positioned(
                                bottom: 2,
                                left: 2,
                                right: 2,
                                child: Container(
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(24),
                                      bottomRight: Radius.circular(24),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.6),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        element.title ?? '',
                                        style: context.text.sb10w400,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter();
        }
      },
    );
  }
}
