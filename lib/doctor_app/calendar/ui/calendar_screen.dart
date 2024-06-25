import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../shared/init/core_d_i.dart';
import '../../../shared/l10n/l10n_helper.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '../data/bloc/calendar_bloc.dart';
import 'widgets/calendar_empty.dart';
import 'widgets/calendar_timeline.dart';

class CalendarScreenDoctor extends StatefulWidget {
  const CalendarScreenDoctor({super.key});

  @override
  State<CalendarScreenDoctor> createState() => _CalendarScreenDoctorState();
}

class _CalendarScreenDoctorState extends State<CalendarScreenDoctor> {
  DateTime date = DateTime.now();

  List<int> item = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
  int selectedIndex = 0;
  void selectChip(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    CoreDi.get<CalendarDocBloc>().add(CalendarFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5, right: 16, top: 25),
            decoration: BoxDecoration(color: context.color.background),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: context.color.textPrimary,
                            size: 32,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 8),
                          child: Text(
                            date
                                .add(Duration(days: selectedIndex))
                                .day
                                .toString(),
                            style: context.text.s40w600,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('EEE').format(
                                date.add(Duration(days: selectedIndex)),
                              ),
                              style: context.text.s14w500
                                  .copyWith(color: context.color.lightGrey),
                            ),
                            Text(
                              DateFormat('MMM yyyy').format(
                                date.add(Duration(days: selectedIndex)),
                              ),
                              style: context.text.s14w500
                                  .copyWith(color: context.color.lightGrey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        selectedIndex = 0;
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          context.color.notificationsCout,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.only(left: 12, right: 12),
                        ),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      child: Text(
                        'Today',
                        style: context.text.s16w600.copyWith(
                          color: context.color.outlineButton,
                          fontFamily: 'Gilroy',
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        ...item.map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 9),
                            child: ChoiceChip(
                              label: Padding(
                                padding: selectedIndex == e
                                    ? const EdgeInsets.only(top: 6, bottom: 6)
                                    : const EdgeInsets.all(0),
                                child: Column(
                                  children: [
                                    Text(
                                      DateFormat('E')
                                          .format(date.add(Duration(days: e))),
                                      style: context.text.s14w500.copyWith(
                                        color: selectedIndex == e
                                            ? context.color.background
                                            : context.color.lightGrey,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      DateFormat('dd')
                                          .format(date.add(Duration(days: e))),
                                      style: context.text.s14w500.copyWith(
                                        color: selectedIndex == e
                                            ? context.color.background
                                            : context.color.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              selected: selectedIndex == e,
                              backgroundColor: context.color.background,
                              selectedColor: context.color.buttonGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              onSelected: (value) {
                                selectChip(e);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: context.color.borderGrey,
            indent: 0,
            endIndent: 0,
          ),
          BlocBuilder(
            bloc: CoreDi.get<CalendarDocBloc>(),
            builder: (context, state) {
              if (state is CalendarInitial) {
                return const SizedBox.shrink();
              }
              if (state is CalendarLoading) {
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                );
              }
              if (state is CalendarError) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(context.s.errorLoadingCalendar),
                  ],
                );
              }
              if (state is CalendarData) {
                var isHasWork = false;
                final actualDate = DateFormat('yyyy-MM-dd')
                    .format(date.add(Duration(days: selectedIndex)));
                state.data.forEach((key, value) {
                  if (state.data.containsKey(actualDate)) {
                    isHasWork = true;
                  }
                });
                if (isHasWork) {
                  return CalendarList(list: state.data[actualDate] ?? []);
                } else {
                  return const CalendarEmpty();
                }
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}








               

            /*return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TimelineTile(
                alignment: TimelineAlign.manual,
                beforeLineStyle: LineStyle(
                  thickness: 2,
                  color: context.color.borderGrey,
                ),
                afterLineStyle: LineStyle(
                  thickness: 2,
                  color: context.color.borderGrey,
                ),
                lineXY: 0.15,
                hasIndicator: false,
                startChild: Padding(
                  padding: const EdgeInsets.only(right: 20, top: 20),
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
                endChild: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 16, top: 20),
                  child: Container(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
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
                                style: context.text.s16w500
                                    .copyWith(color: context.color.textPrimary),
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
                                    backgroundColor: MaterialStateProperty.all(
                                      context.color.background,
                                    ),
                                  ),
                                  child: Text(S.current.leaveNotes),
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
                                    backgroundColor: MaterialStateProperty.all(
                                      context.color.background,
                                    ),
                                  ),
                                  child: Text(S.current.showpatientscard),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ); */