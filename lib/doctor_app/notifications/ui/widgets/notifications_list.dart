import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../shared/app_assets.dart';
import '../../../../shared/init/core_d_i.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../data/bloc/notifications/notifications_bloc.dart';
import '../../data/dto/notifications_model.dart';
import 'alert.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({required this.notiList, super.key});
  final List<NotificationModel> notiList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notiList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (notiList[index].status == 'new') {
                    CoreDi.get<NotificationsDocBloc>()
                        .add(ReadNotifications(id: notiList[index].id!));
                  }
                },
                child: Dismissible(
                  key: notiList[index].id != null
                      ? Key(notiList[index].id.toString())
                      : UniqueKey(),
                  background: Container(
                    color: context.color.error,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                      ),
                      child: SvgPicture.asset(
                        CoreAssets.svg.iDelete,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    final result = await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDelete();
                      },
                    );
                    if (result == true) {
                      CoreDi.get<NotificationsDocBloc>()
                          .add(DeleteNotifications(id: notiList[index].id!));
                    }
                    return null;
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: context.color.background,
                      ),
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 12),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset(
                                  CoreAssets.svg.mesageLogo1,
                                  width: 48,
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          notiList[index].title!,
                                          style: context.text.s16w500.copyWith(
                                            color: context.color.textPrimary,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: notiList[index].status == 'new'
                                              ? SvgPicture.asset(
                                                  CoreAssets.svg
                                                      .newNotificatorIndicator,
                                                  width: 7,
                                                )
                                              : const SizedBox.shrink(),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      notiList[index].body!,
                                      style: context.text.s14w400.copyWith(
                                        color: context.color.textPrimary,
                                        height: 1.5,
                                      ),
                                      maxLines: 2,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      DateFormat('MMM dd, hh:mm').format(
                                        notiList[index].createdAt!.toLocal(),
                                      ),
                                      style: context.text.s10w500.copyWith(
                                        color: context.color.greyText,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
