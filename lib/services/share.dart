import 'package:share_plus/share_plus.dart';

Future<void> share(String fileUrl, String title) async {
  print(fileUrl);
  try {
    await Share.share(
      fileUrl,
      subject: title,
    );
  } catch (e) {
    // Handle error
  }
}
