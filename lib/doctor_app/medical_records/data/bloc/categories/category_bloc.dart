import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/errors_getter.dart';
import '../../api/categories_api.dart';
import '../../dto/categories_model.dart';

part 'events.dart';
part 'states.dart';

class CategoriesDocBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesDocBloc(this.api) : super(CategoiesInitial()) {
    on<CategoriesFetch>(
      (event, emit) async {
        try {
          emit(CategoiesLoading());
          final data = await api.getCategories();
          emit(CategoiesData(data: data));
        } catch (error) {
          emit(CategoiesError(error: errorToString(error)));
        }
      },
    );
  }

  final CategoriesApi api;
}
