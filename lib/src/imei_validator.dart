import 'luhn.dart';

final _fifteenDigits = RegExp(r'^\d{15}$');

/// Whether [imei] is a valid 15-digit IMEI.
///
/// The value must consist of exactly 15 ASCII digits, and the last digit must
/// be the Luhn check digit of the first 14. Separators such as spaces or
/// dashes are not accepted.
///
/// ```dart
/// isValidImei('490154203237518'); // true
/// isValidImei('490154203237519'); // false: wrong check digit
/// ```
bool isValidImei(String imei) {
  if (!_fifteenDigits.hasMatch(imei)) return false;
  final digits = imei.codeUnits.map((unit) => unit - 0x30).toList();
  return luhnCheckDigit(digits.sublist(0, 14)) == digits[14];
}
