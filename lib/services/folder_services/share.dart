import 'package:share_plus/share_plus.dart';
import 'dart:core';

Future<void> share(String fileUrl, String title) async {
  String encodedUrl = Uri.encodeFull(fileUrl);
  print(fileUrl);
  try {
    await Share.share(
      encodedUrl,
      subject: title,
    );
  } catch (e) {
    // Handle error
  }
}
