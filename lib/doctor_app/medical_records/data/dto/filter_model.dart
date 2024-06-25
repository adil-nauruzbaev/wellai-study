import 'categories_model.dart';

class FilterModel {
  FilterModel({
    required this.categoriesList,
    this.endDate,
    this.gridList,
    this.startDate,
  });
  bool? gridList;
  List<CategoriesModel> categoriesList;
  DateTime? startDate;
  DateTime? endDate;
}
