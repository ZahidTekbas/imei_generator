## 2.0.0

Breaking: the API now works with `String` IMEIs instead of `List<int>`.

- `ImeiGenerator.generateImei()` (returned `List<int>`) is replaced by
  `ImeiGenerator.generate()`, which returns a 15-digit `String`.
- `ImeiGenerator.isValidImei(list: ...)` is replaced by the top-level
  function `isValidImei(String)`, which always returns a `bool`. It now also
  rejects values that are not exactly 15 digits.
- `ImeiGenerator` accepts an optional `Random`, so tests can use a seeded one.
- Requires Dart 3.13 or later.

Migrating:

```dart
// 1.x
final imei = ImeiGenerator().generateImei();           // List<int>
final valid = ImeiGenerator().isValidImei(list: imei);

// 2.0
final imei = ImeiGenerator().generate();                // String
final valid = isValidImei(imei);
```

## 1.0.0

- Initial version.
