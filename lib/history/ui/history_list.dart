import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../shared/init/core_d_i.dart';
import '../data/bloc/history_bloc.dart';
import 'history_element.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  void initState() {
    super.initState();
    CoreDi.get<HistoryBloc>().add(FetchHistory());
  }

  bool isSameDay(DateTime? date1, DateTime? date2) {
    if (date1 == null || date2 == null) return false;
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      bloc: CoreDi.get<HistoryBloc>(),
      builder: (context, state) {
        if (state is HistoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HistoryError) {
          return Center(
            child: Text(context.s.errorLoadingHistory),
          );
        }
        if (state.history.isEmpty) {
          return const SizedBox.shrink();
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (notif) {
            if (notif.metrics.extentAfter == 0) {
              CoreDi.get<HistoryBloc>().add(ReadNextHistory());
            }
            return false;
          },
          child: RefreshIndicator(
            onRefresh: () async {
              CoreDi.get<HistoryBloc>().add(FetchHistory());
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.history.length,
                    itemBuilder: (BuildContext context, int index) {
                      final historyItem = state.history[index];
                      return HistoryElement(
                        historyItem: historyItem,
                      );
                    },
                  ),
                ),
                if (state is HistoryPaginationLoading) const LinearProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
