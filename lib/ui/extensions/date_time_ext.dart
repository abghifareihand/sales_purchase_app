import 'package:intl/intl.dart';

const List<String> _dayNames = [
  'Senin',
  'Selasa',
  'Rabu',
  'Kamis',
  'Jumat',
  'Sabtu',
  'Minggu',
];

const List<String> _monthNames = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember',
];

extension DateTimeExt on DateTime {
  DateTime get localTime => toLocal();
  DateTime get wibTime => toUtc().add(const Duration(hours: 7)).toLocal();

  String toFormattedDate() {
    String dayName = _dayNames[wibTime.weekday - 1];
    String day = wibTime.day.toString();
    String month = _monthNames[wibTime.month - 1];
    String year = wibTime.year.toString();
    return '$dayName, $day $month $year';
  }

  String toFormattedMonth() {
    return _monthNames[wibTime.month - 1];
  }

  String toFormattedTime() {
    String hour = wibTime.hour.toString().padLeft(2, '0');
    String minute = wibTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute WIB';
  }

  String toTime() {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute WIB';
  }

  String toFormattedDateTime() {
    String day = wibTime.day.toString();
    String month = _monthNames[wibTime.month - 1];
    String year = wibTime.year.toString();
    String hour = wibTime.hour.toString().padLeft(2, '0');
    String minute = wibTime.minute.toString().padLeft(2, '0');
    return '$day $month $year, $hour.$minute';
  }

  String toFormattedDateForApi() {
    String year = wibTime.year.toString();
    String month = wibTime.month.toString().padLeft(2, '0');
    String day = wibTime.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}

extension StringToDateTime on String {
  DateTime toDateTime() {
    return DateFormat("yyyy-MM-dd").parse(this);
  }

  String toFormattedDateString() {
    DateTime dateTime = toDateTime();
    String dayName = _dayNames[dateTime.weekday - 1];
    String day = dateTime.day.toString();
    String month = _monthNames[dateTime.month - 1];
    String year = dateTime.year.toString();
    return '$dayName, $day $month $year';
  }
}
