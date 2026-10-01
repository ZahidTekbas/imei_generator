/// Returns the Luhn check digit for [payload], a list of decimal digits.
///
/// Starting from the rightmost digit of [payload], every second digit is
/// doubled (subtracting 9 when the result exceeds 9) and all digits are
/// summed. The check digit is what brings that sum to a multiple of 10.
int luhnCheckDigit(List<int> payload) {
  var sum = 0;
  for (var i = 0; i < payload.length; i++) {
    var digit = payload[payload.length - 1 - i];
    if (i.isEven) {
      digit *= 2;
      if (digit > 9) digit -= 9;
    }
    sum += digit;
  }
  return (10 - sum % 10) % 10;
}
