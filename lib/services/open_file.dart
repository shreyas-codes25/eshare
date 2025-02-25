import 'package:url_launcher/url_launcher.dart';

void openFile(String path) async {
  final Uri uri = Uri.parse(path);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}
