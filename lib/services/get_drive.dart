import 'package:eshare/helper/prefs_helper.dart';
import 'package:eshare/models/drive_data_model.dart';
import 'package:eshare/providers/api_endpoints.dart';
import 'package:eshare/providers/api_provider.dart';
import 'package:eshare/screens/startpage/start_page.dart';
import 'package:flutter/material.dart';

Future<List<DriveData>> getDriveData(
    String? path, String? nextToken, BuildContext context) async {
  var token = await PrefsHelper().getPreference("token");

  Map<String, String?> body = {
    "key": path!.isEmpty
        ? ""
        : path.endsWith("/")
            ? path.substring(0, path.length - 1)
            : path,
    "nextToken": nextToken
  };

  Map<String, String> headers = {"X-Access-Token": token ?? ''};

  var response = await ApiProvider.post(
      endPoint: ApiEndpoints.drive, headers: headers, body: body);

  // Ensure the response is a List before mapping
  if (response is List) {
    return response.map((json) => DriveData.fromJson(json)).toList();
  } else {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => StartPage()), (route) => false);
    return [];
  }
}
