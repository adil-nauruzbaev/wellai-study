import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

import '../../../shared/data/root_gateway/root_gateway.dart';
import '../../../shared/init/core_d_i.dart';
import '../../../shared/l10n/generated/l10n.dart';
import '../../../shared/l10n/source/local_storage.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '../data/dto_home/news_model.dart';
import 'package:flutter_html/flutter_html.dart';

class ClinicNewsView extends StatefulWidget {
  const ClinicNewsView({required this.news, super.key});
  final NewsModel news;
  @override
  State<ClinicNewsView> createState() => _ClinicNewsViewState();
}

class _ClinicNewsViewState extends State<ClinicNewsView> {
  final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
  final token = '${CoreDi.get<LocalStorage>().read('token')}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      appBar: AppBar(
        title: Text(
          S.of(context).clinicNews,
          style:
              context.text.s18w500.copyWith(color: context.color.textPrimary),
        ),
        backgroundColor: context.color.background,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: context.color.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl:
                          '${baseUrl.substring(0, baseUrl.length - 1)}${widget.news.image?.path ?? ''}',
                      httpHeaders: {'Authorization': 'Bearer $token'},
                      fit: BoxFit.cover,
                      placeholder: (context, _) {
                        return BlurHash(hash: widget.news.image?.blur ?? '');
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Html(
                data: widget.news.text ?? '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
