import 'package:intl/intl.dart';
import 'sha256_converter.dart';

String apiKey() {
  final format = DateFormat('MM/dd/yyyy');
  final dateNow = format.format(DateTime.now());

  String key = "actsafeisproj2$dateNow";

  return sha256Encode(key);
}
