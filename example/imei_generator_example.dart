import 'package:imei_generator/imei_generator.dart';

void main() {
  var imeiGenerator = ImeiGenerator();
  var imei = imeiGenerator.generateImei();
  print(imei);
  var isValid = imeiGenerator.isValidImei(list: imei);
  print("isValid Imei: $isValid");
}
