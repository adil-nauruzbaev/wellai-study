import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../shared/app_error_widget.dart';
import '../../../../../../shared/init/core_d_i.dart';
import '../../../data/bloc/documents_model_bloc/bloc.dart';
import '../../../data/dto/filter.dart';
import 'grid_elemen/grid_element.dart';
import 'list_element/list_element.dart';

class GridListModifaer extends StatefulWidget {
  const GridListModifaer({
    required this.filter,
    super.key,
  });

  final FilterDTO filter;

  @override
  State<GridListModifaer> createState() => _GridListModifaerState();
}

class _GridListModifaerState extends State<GridListModifaer> {
  @override
  void initState() {
    super.initState();
    CoreDi.get<DocumentlBloc>().add(FetchDocument(FilterDTO()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentlBloc, DocumentState>(
      bloc: CoreDi.get<DocumentlBloc>(),
      builder: (context, state) {
        if (state is DocumentLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is DocumentError) {
          return AppErrorWidget(
            message: state.error,
            onRefresh: () {
              CoreDi.get<DocumentlBloc>().add(FetchDocument(FilterDTO()));
            },
          );
        }
        if (state is DocumentData) {
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                CoreDi.get<DocumentlBloc>().add(FetchDocument(widget.filter));
              },
              child: widget.filter.state == ViewState.grid
                  ? GridView.builder(
                      itemCount: state.documents.length,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.5,
                        horizontal: 16.5,
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, index) {
                        final documentItem = state.documents[index];
                        return GridElement(
                          documentItem: documentItem,
                          currentFilter: widget.filter,
                        );
                      },
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.5,
                        horizontal: 16.5,
                      ),
                      itemCount: state.documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final documentItem = state.documents[index];
                        return ListElement(
                          documentItem: documentItem,
                        );
                      },
                    ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
