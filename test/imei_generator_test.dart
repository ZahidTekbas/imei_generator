import 'dart:math';

import 'package:imei_generator/imei_generator.dart';
import 'package:test/test.dart';

void main() {
  group('ImeiGenerator', () {
    test('generates 15-digit IMEIs that pass validation', () {
      final generator = ImeiGenerator();
      for (var i = 0; i < 1000; i++) {
        final imei = generator.generate();
        expect(imei, matches(RegExp(r'^\d{15}$')));
        expect(isValidImei(imei), isTrue, reason: imei);
      }
    });

    test('starts every IMEI with a Reporting Body Identifier', () {
      const reportingBodyIds = {
        '01', '10', '30', '33', '35', '44', '45', '49', '50', //
        '51', '52', '53', '54', '86', '91', '98', '99',
      };
      final generator = ImeiGenerator();
      for (var i = 0; i < 1000; i++) {
        expect(
          reportingBodyIds,
          contains(generator.generate().substring(0, 2)),
        );
      }
    });

    test('is repeatable with a seeded Random', () {
      final first = ImeiGenerator(random: Random(42));
      final second = ImeiGenerator(random: Random(42));
      for (var i = 0; i < 10; i++) {
        expect(first.generate(), second.generate());
      }
    });
  });
}
