import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as p;

void openFile(String? url) async {
  if (url == null || url.isEmpty) {
    print("Invalid URL.");
    return;
  }

  try {
    // Extract the file name from the URL
    String fileName = p.basename(Uri.parse(url).path);

    // Get device's downloads directory
    Directory tempDir = await getTemporaryDirectory();
    String filePath =
        "${tempDir.path}/$fileName"; // Save with the correct file name

    // Download file using Dio
    Dio dio = Dio();
    await dio.download(url, filePath);

    // Open file in default app based on file type
    OpenFilex.open(filePath);
  } catch (e) {
    print("Error downloading or opening file: $e");
  }
}
