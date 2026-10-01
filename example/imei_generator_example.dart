import 'package:imei_generator/imei_generator.dart';

void main() {
  final generator = ImeiGenerator();

  final imei = generator.generate();
  print('Generated IMEI: $imei');
  print('Valid: ${isValidImei(imei)}');

  print('490154203237519 valid: ${isValidImei('490154203237519')}');
}
