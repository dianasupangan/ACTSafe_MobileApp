import 'dart:convert';
import 'package:crypto/crypto.dart';

String sha256Encode(String input) {
  var bytes1 = utf8.encode(input); // data being hashed
  var convert = sha256.convert(bytes1).toString();

  return convert;
}
