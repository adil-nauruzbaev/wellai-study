import 'documents_dto.dart';

class FilterDTO {
  FilterDTO({
    this.dataFrom,
    this.dataTo,
    this.categories,
    this.state,
    this.sort,
  });

  final List<CategoryDto>? categories;
  final ViewState? state;
  final DateTime? dataFrom;
  final DateTime? dataTo;
  final bool? sort;

  FilterDTO copyWith({
    List<CategoryDto>? categories,
    ViewState? state,
    DateTime? dataFrom,
    DateTime? dataTo,
    bool? sort,
  }) {
    return FilterDTO(
      sort: sort ?? this.sort,
      dataFrom: dataFrom ?? this.dataFrom,
      dataTo: dataTo ?? this.dataTo,
      categories: categories ?? this.categories,
      state: state ?? this.state,
    );
  }
}

enum ViewState {
  grid,
  list;
}
