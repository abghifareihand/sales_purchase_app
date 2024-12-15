import 'package:intl/intl.dart';

class Formatter {
  static String formatAmount(String value) {
    final int? number = int.tryParse(value.replaceAll('.', ''));
    if (number == null) {
      return '';
    }
    return number
        .toString()
        .replaceAllMapped(
          RegExp(r'(\d+)(\d{3})'),
          (Match m) => '${m[1]}.${m[2]}',
        )
        .replaceAllMapped(
          RegExp(r'(\d+)(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }

  static String getRawAmount(String formattedValue) {
    return formattedValue.replaceAll('.', '');
  }

  static String formatRupiah(String value) {
    final int? number = int.tryParse(value.replaceAll('.', ''));
    if (number == null) {
      return '';
    }
    final currencyFormat = NumberFormat.simpleCurrency(locale: 'id_ID');
    return currencyFormat.format(number);
  }
}

extension IntegerExt on int {
  String get currencyFormatRp => NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp ',
        decimalDigits: 0,
      ).format(this);
}
