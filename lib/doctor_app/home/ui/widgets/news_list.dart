import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:intl/intl.dart';

import '../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../shared/init/core_d_i.dart';
import '../../../../shared/l10n/l10n_helper.dart';
import '../../../../shared/l10n/source/local_storage.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../data/bloc/clinic_news/news_bloc.dart';
import '../clinic_news_view_screen.dart';

class NewsListView extends StatelessWidget {
  NewsListView({super.key});

  final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
  final token = '${CoreDi.get<LocalStorage>().read('token')}';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsDoctorBloc, NewsState>(
      bloc: CoreDi.get<NewsDoctorBloc>(),
      builder: (context, state) {
        if (state is NewsInitial) {
          return const SizedBox.shrink();
        }
        if (state is NewsLoading) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          );
        }
        if (state is NewsError) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(context.s.errorLoadingNews),
            ],
          );
        }
        if (state is NewsData) {
          final newsList = state.data;
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 12,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ClinicNewsView(news: newsList[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: context.color.background,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: CachedNetworkImage(
                                  imageUrl: '${baseUrl.substring(
                                    0,
                                    baseUrl.length - 1,
                                  )}${state.data[index].image?.path ?? ''}',
                                  httpHeaders: {
                                    'Authorization': 'Bearer $token',
                                  },
                                  fit: BoxFit.cover,
                                  placeholder: (context, _) {
                                    return BlurHash(
                                      hash: state.data[index].image?.blur ?? '',
                                    );
                                  },
                                  width: 64,
                                  height: 64,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    newsList[index].header ?? '',
                                    style: context.text.s14w500.copyWith(
                                      color: context.color.textPrimary,
                                    ),
                                    softWrap: true,
                                    maxLines: 2,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    newsList[index].createdAt != null
                                        ? DateFormat('MMM dd, hh:mm').format(
                                            newsList[index]
                                                .createdAt!
                                                .toLocal(),
                                          )
                                        : '',
                                    style: context.text.s12w400.copyWith(
                                      color: context.color.greyText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: context.color.buttonGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
