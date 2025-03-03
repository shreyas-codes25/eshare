import 'package:eshare/services/manage_access_services/select_date.dart';
import 'package:eshare/services/manage_access_services/update_based_on_time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpirationPicker extends StatefulWidget {
  const ExpirationPicker({super.key, required this.expirationEnabled});
  final bool expirationEnabled;

  @override
  State<ExpirationPicker> createState() => _ExpirationPickerState();
}

class _ExpirationPickerState extends State<ExpirationPicker> {
  String selectedTime = "1 Month";
  DateTime? selectedDate;

  final List<String> timeOptions = [
    "7 Days",
    "15 Days",
    "1 Month",
    "3 Months",
    "6 Months",
    "1 Year",
    "Other"
  ];

  void _selectDate(BuildContext context, DateTime? selectedDate) async {
    final selectedTime = await selectDate(context, selectedDate);
    if (selectedTime != null) {
      setState(() {
        this.selectedDate = selectedTime["selectedDate"];
        this.selectedTime = selectedTime["selectedTime"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      reverseDuration: Duration(milliseconds: 200),
      alignment: Alignment.topCenter,
      child: Visibility(
        visible: widget.expirationEnabled,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Select Time:", style: TextStyle(fontSize: 16)),
                  DropdownButton<String>(
                    value: selectedTime,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedTime = newValue;
                          if (newValue != "Other") {
                            setState(() {
                              selectedDate = updateDateBasedOnTime(newValue);
                            });
                          }
                        });
                      }
                    },
                    items: timeOptions.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                  Spacer(),
                  Text("Select Date:", style: TextStyle(fontSize: 16)),
                  TextButton(
                    onPressed: () {
                      _selectDate(context, selectedDate);
                    },
                    child: Text(
                      selectedDate != null
                          ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                          : "Pick a Date",
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Expiry Set: ${selectedDate != null ? DateFormat('dd/MM/yyyy').format(selectedDate!) : "Not Selected"}",
                      ),
                    ),
                  );
                },
                child: Text("Set Expiry"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
