import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void copyLink(String link, BuildContext context) {
  print(link);
  Clipboard.setData(ClipboardData(text: link));
  Fluttertoast.showToast(msg: "Link Copied to Clipboard");
}
