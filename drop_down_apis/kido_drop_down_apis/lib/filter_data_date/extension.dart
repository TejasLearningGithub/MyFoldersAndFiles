extension DateTimeHelper on DateTime {
  String toDDMMYYYY() {
    return '$day/$month/$year';
  }

  String toYYYYMMDD() {
    return '$year/$month/$day';
  }

  String toMMDDYYYY() {
    return '$month/$day/$year';
  }
}
