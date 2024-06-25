import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:intl/intl.dart';
import '../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../shared/init/core_d_i.dart';
import '../../../../shared/l10n/l10n_helper.dart';
import '../../../../shared/l10n/source/local_storage.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../data/dto/work_time.dart';

class CalendarList extends StatelessWidget {
  CalendarList({required this.list, super.key});
  final List<WorkTime> list;
  final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
  final token = '${CoreDi.get<LocalStorage>().read('token')}';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.70;
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: list.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, top: 24),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 23.7,
                      ),
                      child: Text(
                        context.s.time,
                        style: context.text.s14w500
                            .copyWith(color: context.color.lightGrey),
                      ),
                    ),
                    Container(
                      width: 2,
                      color: context.color.borderGrey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        context.s.patients,
                        style: context.text.s14w500
                            .copyWith(color: context.color.lightGrey),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            final endTime = list[index - 1].time != null
                ? list[index - 1].time!.add(const Duration(hours: 1))
                : DateFormat('HH:mm').parse('00:00');
            final name =
                list[index - 1].appointments?[0].user?.profile?.firstName ?? '';
            final surname =
                list[index - 1].appointments?[0].user?.profile?.lastName ?? '';
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 20),
                      child: Expanded(
                        child: Column(
                          children: [
                            Text(
                              DateFormat('HH:mm')
                                  .format(list[index - 1].time ?? DateTime(0)),
                              style: context.text.s14w500
                                  .copyWith(color: context.color.textPrimary),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              DateFormat('HH:mm').format(endTime),
                              style: context.text.s14w500
                                  .copyWith(color: context.color.lightGrey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 2,
                      color: context.color.borderGrey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                      ),
                      child: Container(
                        width: containerWidth,
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 12),
                        decoration: BoxDecoration(
                          color: context.color.backgroundGrey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${baseUrl}images/${list[index - 1].appointments?[0].user?.profile?.image?.name ?? ''}',
                                    httpHeaders: {
                                      'Authorization': 'Bearer $token',
                                    },
                                    fit: BoxFit.cover,
                                    placeholder: (context, _) {
                                      return BlurHash(
                                        hash: list[index - 1]
                                                .appointments?[0]
                                                .user
                                                ?.profile
                                                ?.image
                                                ?.blur ??
                                            '',
                                      );
                                    },
                                    width: 28,
                                    height: 28,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    '$name $surname',
                                    style: context.text.s16w500.copyWith(
                                      color: context.color.textPrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: context.button.outline3.copyWith(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          context.color.background,
                                        ),
                                      ),
                                      child: Text(context.s.leaveNotes),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: context.button.outline3.copyWith(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          context.color.background,
                                        ),
                                      ),
                                      child: Text(context.s.showpatientscard),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
