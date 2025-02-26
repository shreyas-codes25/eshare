import 'package:flutter/material.dart';
import 'package:eshare/models/drive_data_model.dart';
import 'package:eshare/services/get_drive.dart';

Future<List<DriveData>> updateFolder(
    String folderName, List<String> breadCrumbs, BuildContext context) {
  breadCrumbs.add(folderName);
  String folderPath =
      breadCrumbs.length > 1 ? breadCrumbs.sublist(1).join("/") : "";
  return getDriveData(folderPath, null, context);
}

Future<List<DriveData>> refreshCurrentFolder(
    List<String> breadCrumbs, BuildContext context) {
  String folderPath =
      breadCrumbs.length > 1 ? breadCrumbs.sublist(1).join("/") : "";
  return getDriveData(folderPath, null, context);
}
