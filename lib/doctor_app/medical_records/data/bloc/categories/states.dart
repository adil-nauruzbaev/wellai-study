part of 'category_bloc.dart';

abstract class CategoriesState {}

class CategoiesInitial extends CategoriesState {}

class CategoiesLoading extends CategoriesState {}

class CategoiesError extends CategoriesState {
  CategoiesError({required this.error});
  final String error;
}

class CategoiesData extends CategoriesState {
  CategoiesData({required this.data});
  final List<CategoriesModel> data;
}
