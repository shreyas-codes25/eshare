import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eshare/helper/req_permission.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String?> downloadFile(String fileUrl, String fileName) async {
  try {
    // Request storage permission (Android 10 and below)
    bool permissionGranted = await requestPermission(Permission.storage);
    if (permissionGranted) {
      // Get the downloads directory
      Directory? downloadsDirectory;
      if (Platform.isAndroid) {
        downloadsDirectory = Directory(
            '/storage/emulated/0/Download'); // Public Downloads folder
      } else {
        downloadsDirectory = await getDownloadsDirectory(); // For iOS/macOS
      }

      if (downloadsDirectory == null) {
        print("Could not find downloads directory");
        return null;
      }

      String savePath = '${downloadsDirectory.path}/$fileName';

      // Download file using Dio
      Dio dio = Dio();
      await dio.download(fileUrl, savePath);
      Fluttertoast.showToast(msg: "File Downloaded Successfully!");
      print("File downloaded to: $savePath");
      return savePath;
    } else {
      Fluttertoast.showToast(msg: "Permission Denied!");
    }
  } catch (e) {
    print("Error downloading file: $e");
    return null;
  }
  return null;
}
