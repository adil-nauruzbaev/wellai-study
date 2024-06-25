import 'qualifification_dto.dart';

class FilterPhysDTO {
  FilterPhysDTO({
    this.dataFrom,
    this.dataTo,
    this.qualififications,
    this.sort,
  });

  final List<QualifificationDTO>? qualififications;

  final DateTime? dataFrom;
  final DateTime? dataTo;
  final bool? sort;

  FilterPhysDTO copyWith({
    List<QualifificationDTO>? qualififications,
    DateTime? dataFrom,
    DateTime? dataTo,
    bool? sort,
  }) {
    return FilterPhysDTO(
      sort: sort ?? this.sort,
      dataFrom: dataFrom ?? this.dataFrom,
      dataTo: dataTo ?? this.dataTo,
      qualififications: qualififications ?? this.qualififications,
    );
  }
}
