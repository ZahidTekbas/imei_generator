import 'package:imei_generator/imei_generator.dart';
import 'package:test/test.dart';

void main() {
  group('isValidImei', () {
    test('accepts IMEIs with a correct check digit', () {
      expect(isValidImei('490154203237518'), isTrue);
      expect(isValidImei('356938035643809'), isTrue);
      expect(isValidImei('012345678901237'), isTrue);
      expect(isValidImei('000000000000000'), isTrue);
    });

    test('rejects an incorrect check digit', () {
      expect(isValidImei('490154203237519'), isFalse);
      expect(isValidImei('356938035643800'), isFalse);
    });

    test('rejects a single changed digit', () {
      expect(isValidImei('490154203237528'), isFalse);
    });

    test('rejects the wrong length', () {
      expect(isValidImei(''), isFalse);
      expect(isValidImei('49015420323751'), isFalse);
      expect(isValidImei('4901542032375180'), isFalse);
    });

    test('rejects non-digit characters', () {
      expect(isValidImei('49015420323751a'), isFalse);
      expect(isValidImei('49-015420-323751-8'), isFalse);
      expect(isValidImei(' 490154203237518'), isFalse);
      expect(isValidImei('４９０１５４２０３２３７５１８'), isFalse);
    });
  });
}
