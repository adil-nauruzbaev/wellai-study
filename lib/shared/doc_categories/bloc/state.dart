part of 'bloc.dart';

abstract class CategoriesState {
  const CategoriesState();
}

class CategoriesError extends CategoriesState with EquatableMixin {
  CategoriesError({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesData extends CategoriesState {
  CategoriesData(this.documentCategories);
  final List<CategoryDto> documentCategories;
}
