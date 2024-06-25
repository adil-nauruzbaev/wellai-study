import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../shared/init/core_d_i.dart';
import '../data/bloc/bloc.dart';
import '../data/work_th_dto.dart';
import 'widgets/app_bar_th.dart';
import 'widgets/scrolling_calendar.dart';
import 'widgets/th_list/calendar_holder.dart';
import 'widgets/th_list/date_select_element.dart';
import '/shared/l10n/l10n_helper.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  late DateTime selectedDate;
  late DateTime startDate;
  late DateTime endDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    startDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );
    endDate = startDate.add(const Duration(days: 13));

    _fetchData();
  }

  void _fetchData() {
    final start = DateFormat('yyyy-MM-dd').format(startDate);
    final end = DateFormat('yyyy-MM-dd').format(endDate);

    CoreDi.get<WorkThBloc>().add(FetchData(start: start, end: end));
  }

  @override
  Widget build(BuildContext context) {
    final dayNumber = DateFormat('d').format(DateTime.now());
    final dayAbbreviation = DateFormat('E', 'en_US').format(DateTime.now());
    final monthYear = DateFormat('MMM y', 'en_US').format(DateTime.now());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 1),
        child: AppBarTH(
          dayNumber: dayNumber,
          dayAbbreviation: dayAbbreviation,
          monthYear: monthYear,
        ),
      ),
      body: BlocListener<WorkThBloc, WorkThState>(
        bloc: CoreDi.get<WorkThBloc>(),
        listener: (context, state) {
          if (state is WorkThSuccess) {
            if (state.sortedAndGroupedWorktimes.isEmpty) {
              final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
              CoreDi.get<WorkThBloc>().add(DateSelected(formattedDate));
            }
          }
        },
        child: BlocBuilder<WorkThBloc, WorkThState>(
          bloc: CoreDi.get<WorkThBloc>(),
          builder: (context, state) {
            if (state is WorkThLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WorkThError) {
              return Center(child: Text(context.s.errorLoadingHistory));
            }

            List<WorkTimeDTO>? appointmentsForSelectedDate;
            if (state is WorkThSuccess) {
              appointmentsForSelectedDate =
                  state.sortedAndGroupedWorktimes[DateFormat('yyyy-MM-dd').format(selectedDate)];
            }

            return Column(
              children: [
                ScrollableCalendar(
                  onDateSelected: (String formattedDate) {
                    final date = DateFormat('yyyy-MM-dd').parse(formattedDate);
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: appointmentsForSelectedDate != null && appointmentsForSelectedDate.isNotEmpty
                      ? ListView.builder(
                          itemCount: appointmentsForSelectedDate.length,
                          itemBuilder: (context, index) {
                            final currentAppointment = appointmentsForSelectedDate![index];
                            bool showTime = index == 0 ||
                                appointmentsForSelectedDate[index].time != appointmentsForSelectedDate[index - 1].time;
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: DateSelectElement(appointment: currentAppointment, showTime: showTime),
                            );
                          },
                        )
                      : const CalendarHolder(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
