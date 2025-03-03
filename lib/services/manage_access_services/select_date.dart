import 'package:flutter/material.dart';

Future<Map<String, dynamic>?> selectDate(
    BuildContext context, DateTime? selectedDate) async {
  DateTime now = DateTime.now();
  DateTime firstDate = now;
  DateTime lastDate = now.add(Duration(days: 365 * 5)); // 5 years ahead
  Map<String, dynamic>? selectedTime;

  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate ?? now,
    firstDate: firstDate,
    lastDate: lastDate,
  );

  if (picked != null && picked != selectedDate) {
    selectedTime = {"selectedDate": picked, "selectedTime": "Other"};
    return selectedTime;
  }
  return null;
}
