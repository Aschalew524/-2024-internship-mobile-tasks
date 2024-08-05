import 'dart:io';

String readJson(String path) {
  final file = File(path);
  if (!file.existsSync()) {
    throw Exception('File not found: $path');
  }
  return file.readAsStringSync();
}
