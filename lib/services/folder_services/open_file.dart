import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;

void openFile(String? url) async {
  if (url == null || url.isEmpty) {
    print("Invalid URL.");
    return;
  }

  try {
    String fileName = p.basename(Uri.parse(url).path);

    Directory tempDir = await getTemporaryDirectory();
    String filePath = "${tempDir.path}/$fileName";

    Dio dio = Dio();
    await dio.download(url, filePath);

    OpenFile.open(filePath);
  } catch (e) {
    print("Error downloading or opening file: $e");
  }
}
