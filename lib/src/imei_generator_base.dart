import 'dart:math' as math;

class ImeiGenerator {
  // Generates a random imei
  List<int> generateImei() {
    List<int> list = [];

    String t = _build();

    for (var rune in t.runes) {
      list.add(int.parse(String.fromCharCode(rune)));
    }
    return list;
  }

  _build() {
    var pos;
    var str = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    var sum = 0;
    var finalDigit = 0;
    var t = 0;
    var lenOffset = 0;
    var len = 15;
    var rbi = ["01", "10", "30", "33", "35", "44", "45", "49", "50", "51", "52", "53", "54", "86", "91", "98", "99"];
    var dbl = math.Random.secure().nextDouble();
    var arr = rbi[(dbl * rbi.length).floor()].split("");

    str[0] = int.parse(arr[0]);
    str[1] = int.parse(arr[1]);
    pos = 2;

    while (pos < len - 1) {
      str[pos++] = (math.Random.secure().nextDouble() * 10).floor() % 10;
    }

    lenOffset = (len + 1) % 2;
    for (pos = 0; pos < len - 1; pos++) {
      if ((pos + lenOffset) % 2 == 1) {
        t = str[pos] * 2;
        if (t > 9) {
          t -= 9;
        }
        sum += t;
      } else {
        sum += str[pos];
      }
    }

    finalDigit = (10 - (sum % 10)) % 10;
    str[len - 1] = finalDigit;

    return str.join("");
  }

  // Dart does not support 64 bit integers
  // Thus, it is required to parse your IMEI string into List<int>
  isValidImei({required List<int> list}) {
    BigInt? imei = (BigInt.tryParse(list.join("")));
    BigInt sum = BigInt.from(0);
    if (imei != null) {
      for (int i = list.length; i >= 1; i--) {
        BigInt t = imei! % BigInt.from(10);
        if (i % 2 == 0) {
          t = BigInt.from(2) * t;
        }
        sum += _sumDigBigInt(t);
        imei = BigInt.from(imei / BigInt.from(10));
      }
      return (sum % BigInt.from(10) == BigInt.from(0));
    }
  }

  BigInt _sumDigBigInt(BigInt n) {
    BigInt a = BigInt.from(0);
    while (n > BigInt.from(0)) {
      a = a + (n % BigInt.from(10));
      n = BigInt.from(n / BigInt.from(10));
    }
    return a;
  }
}
