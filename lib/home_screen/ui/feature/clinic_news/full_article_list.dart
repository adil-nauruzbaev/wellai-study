import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:intl/intl.dart';
import '../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../shared/init/core_d_i.dart';
import '../../../../shared/l10n/source/local_storage.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../data/dto_home/news_response.dart';
import '/shared/l10n/l10n_helper.dart';

class FullArticle extends StatelessWidget {
  const FullArticle({required this.newsItem, super.key});
  final NewsResponseDto newsItem;

  @override
  Widget build(BuildContext context) {
    final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
    final token = '${CoreDi.get<LocalStorage>().read('token')}';
    return Scaffold(
      backgroundColor: context.color.backgroundGrey,
      appBar: AppBar(
        backgroundColor: context.color.background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.color.shadow),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          context.s.news,
          style: context.text.m18w400,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(
                newsItem.header ?? 'No Title',
                style: context.text.m16w400,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 176,
                width: double.infinity,
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
              const SizedBox(
                height: 12,
              ),
              Text(
                newsItem.createdAt != null ? DateFormat('MMM dd, hh:mm').format(newsItem.createdAt!.toLocal()) : '',
                style: context.text.sn14w400,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                newsItem.text ?? '',
                style: context.text.shadowGr14w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
