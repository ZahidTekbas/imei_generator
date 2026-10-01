Generate random, valid 15-digit IMEI numbers, and validate any IMEI.

Useful for test data, form validation and mocking device identifiers. The
generated numbers are random and not assigned to real devices.

## Features

- `ImeiGenerator().generate()` returns a random IMEI that starts with a real
  Reporting Body Identifier and ends with a correct Luhn check digit.
- `isValidImei(imei)` checks that a string is exactly 15 digits with a correct
  check digit.
- No dependencies; works on every platform, including the web.

## Installation

```sh
dart pub add imei_generator
```

## Usage

```dart
import 'package:imei_generator/imei_generator.dart';

void main() {
  final imei = ImeiGenerator().generate();
  print(imei); // e.g. 356938035643809

  print(isValidImei(imei)); // true
  print(isValidImei('490154203237519')); // false: wrong check digit
}
```

For repeatable output, for example in tests, pass a seeded `Random`:

```dart
import 'dart:math';

final generator = ImeiGenerator(random: Random(42));
```

`isValidImei` does not strip separators; remove spaces or dashes first if your
input may contain them.

## Upgrading from 1.x

Version 2.0 uses `String` instead of `List<int>`. See the
[changelog](CHANGELOG.md) for the migration steps.

## Additional information

Found a bug or have an idea? Please
[open an issue](https://github.com/ZahidTekbas/imei_generator/issues).
