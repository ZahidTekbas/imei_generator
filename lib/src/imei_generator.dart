import 'dart:math';

import 'imei_validator.dart' show isValidImei;
import 'luhn.dart';

/// Reporting Body Identifiers: the first two digits of a Type Allocation Code,
/// identifying the body that allocated it. Starting generated IMEIs with one
/// of these makes them look like real ones.
const _reportingBodyIds = [
  '01', '10', '30', '33', '35', '44', '45', '49', '50', //
  '51', '52', '53', '54', '86', '91', '98', '99',
];

/// Generates random, valid 15-digit IMEI numbers.
///
/// Each IMEI starts with a real Reporting Body Identifier, continues with
/// 12 random digits and ends with the Luhn check digit, so it passes
/// [isValidImei]. The numbers are random and not assigned to any device;
/// use them for testing only.
///
/// ```dart
/// final imei = ImeiGenerator().generate(); // e.g. '356938035643809'
/// ```
class ImeiGenerator {
  /// Creates a generator that draws digits from [random].
  ///
  /// Defaults to [Random.secure]. Pass a seeded [Random] to get a repeatable
  /// sequence, for example in tests.
  ImeiGenerator({Random? random}) : _random = random ?? Random.secure();

  final Random _random;

  /// Returns a new random IMEI as a 15-digit string.
  String generate() {
    final reportingBodyId =
        _reportingBodyIds[_random.nextInt(_reportingBodyIds.length)];
    final payload = [
      for (final unit in reportingBodyId.codeUnits) unit - 0x30,
      for (var i = 0; i < 12; i++) _random.nextInt(10),
    ];
    return [...payload, luhnCheckDigit(payload)].join();
  }
}
