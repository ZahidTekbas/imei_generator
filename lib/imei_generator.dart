/// Generate and validate IMEI (International Mobile Equipment Identity)
/// numbers.
///
/// ```dart
/// import 'package:imei_generator/imei_generator.dart';
///
/// final imei = ImeiGenerator().generate();
/// print(isValidImei(imei)); // true
/// ```
library;

export 'src/imei_generator.dart' show ImeiGenerator;
export 'src/imei_validator.dart' show isValidImei;
