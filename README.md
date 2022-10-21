<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This package is simple. It helps you to generate an IMEI number and validates any given IMEI.

## Features

Generate IMEI number
Validate IMEI number

## Getting started

Just add it to your dependencies and you are good to go

## Usage

```dart
  var imeiGenerator = ImeiGenerator();
  var imei = imeiGenerator.generateImei();
  print(imei);
  var isValid = imeiGenerator.isValidImei(list: imei);
  print("isValid Imei: $isValid");
```

## Additional information

If you find something wrong or a better solution, please fill an issue in Github
