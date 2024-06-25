import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:intl/intl.dart';
import '../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../shared/init/core_d_i.dart';
import '../../../../shared/l10n/source/local_storage.dart';
import '../../../../shared/navigator/navigator1_helper.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../data/bloc_news/news_bloc.dart';
import '../../../data/dto_home/news_response.dart';
import 'full_article_list.dart';
import '/shared/l10n/l10n_helper.dart';

class ClinicNews extends StatefulWidget {
  const ClinicNews({super.key});

  @override
  State<ClinicNews> createState() => _ClinicNewsState();
}

class _ClinicNewsState extends State<ClinicNews> {
  @override
  void initState() {
    super.initState();
    CoreDi.get<NewsBloc>().add(FetchNews());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: CoreDi.get<NewsBloc>(),
      builder: (context, state) {
        if (state is NewsLoading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is NewsData) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final newsItem = state.news[index];
                return ClinicNwesItem(
                  newsItem: newsItem,
                );
              },
              childCount: state.news.length,
            ),
          );
        } else if (state is NewsError) {
          return SliverFillRemaining(
            child: Center(child: Text(context.s.errorLoadingNews)),
          );
        } else {
          return SliverFillRemaining(
            child: Center(child: Text(context.s.noData)),
          );
        }
      },
    );
  }
}

class ClinicNwesItem extends StatefulWidget {
  const ClinicNwesItem({
    required this.newsItem,
    super.key,
  });
  final NewsResponseDto newsItem;

  @override
  State<ClinicNwesItem> createState() => _ClinicNwesItemState();
}

class _ClinicNwesItemState extends State<ClinicNwesItem> {
  @override
  Widget build(BuildContext context) {
    final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
    final token = '${CoreDi.get<LocalStorage>().read('token')}';
    final newsItem = widget.newsItem;
    return GestureDetector(
      onTap: () {
        context.rootRouter.use.push(FullArticle(newsItem: newsItem));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CachedNetworkImage(
                  imageUrl: '${baseUrl.substring(
                    0,
                    baseUrl.length - 1,
                  )}${newsItem.image?.path ?? ''}',
                  httpHeaders: {
                    'Authorization': 'Bearer $token',
                  },
                  fit: BoxFit.cover,
                  placeholder: (context, _) {
                    return BlurHash(
                      hash: newsItem.image?.blur ?? '',
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsItem.header ?? '',
                        style: context.text.m14w400,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        newsItem.createdAt != null ? DateFormat('MMM dd, hh:mm').format(newsItem.createdAt!.toLocal()) : '',
                        style: context.text.sn12w400,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SizedBox(
                  height: 12,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: context.color.accent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
