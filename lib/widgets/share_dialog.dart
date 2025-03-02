import 'package:eshare/screens/folder_screen/file_details.dart';
import 'package:flutter/material.dart';

void showShareDialog(BuildContext context, String url, String shortUrl,
    String name, String size, String modifiedDate) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: FractionallySizedBox(
          heightFactor: 0.6,
          child: FileDetails(
            url: url,
            shortUrl: shortUrl,
            name: name,
            size: size,
            modifiedDate: modifiedDate,
          ),
        ),
      );
    },
  );
}
