extension DateTimeUtils on DateTime? {
  String? get timeString {
    if (this == null) return null;
    return '${this!.hour.toString().padLeft(2, '0')}:${this!.minute.toString().padLeft(2, '0')}';
  }

  String? get dateString {
    if (this == null) return null;
    return '${this!.year}-${this!.month}-${this!.day}';
  }

  DateTime? fromDateAndTime(String? date, String? time) {
    if (date == null || time == null) return null;
    final parts = date
        .split('-')
        .map(
          int.tryParse,
        )
        .toList();
    if (parts.length != 3) return null;

    final timeParts = time.split(':').map(
          int.tryParse,
        );
    if (timeParts.length < 2) {
      return null;
    }

    parts.addAll(timeParts);
    if (parts.any((item) => item == null)) {
      return null;
    }

    return DateTime(
      parts[0]!,
      parts[1]!,
      parts[2]!,
      parts[3]!,
      parts[4]!,
    );
  }

  int get daysInMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 1, 0).day;
  }

  int? get remainingSeconds {
    if (this == null) return null;
    return this!.difference(DateTime.now()).inSeconds.clamp(0, 100000000);
  }
}
