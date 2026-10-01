import 'package:imei_generator/src/luhn.dart';
import 'package:test/test.dart';

List<int> _digits(String s) => s.codeUnits.map((unit) => unit - 0x30).toList();

void main() {
  test('luhnCheckDigit matches known values', () {
    expect(luhnCheckDigit(_digits('49015420323751')), 8);
    expect(luhnCheckDigit(_digits('35693803564380')), 9);
    expect(luhnCheckDigit(_digits('7992739871')), 3);
    expect(luhnCheckDigit(_digits('00000000000000')), 0);
    expect(luhnCheckDigit([]), 0);
  });
}
