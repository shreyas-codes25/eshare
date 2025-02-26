import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String title, BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.onPrimary,
    title: Text(title,
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold)),
  );
}
