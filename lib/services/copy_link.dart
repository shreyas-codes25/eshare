import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "dart:core";

void copyLink(String link, BuildContext context) {
  link = Uri.encodeFull(link);
  print(link);
  Clipboard.setData(ClipboardData(text: link));
  Fluttertoast.showToast(msg: "Link Copied to Clipboard");
}
