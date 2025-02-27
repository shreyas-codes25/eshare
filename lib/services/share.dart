import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> share(String fileUrl, String title) async {
  try {
    final response = await http.get(Uri.parse(fileUrl));

    if (response.statusCode == 200) {
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/$title');
      await tempFile.writeAsBytes(response.bodyBytes);

      final XFile xFile = XFile(tempFile.path);
      await Share.shareXFiles(
        [xFile],
        subject: title,
      );
    } else {
      throw Exception('Failed to download image: ${response.statusCode}');
    }
  } catch (e) {
    //print('Error while sharing: $e');
  }
}
