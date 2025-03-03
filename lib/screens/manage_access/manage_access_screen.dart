import 'package:eshare/screens/manage_access/expire_picker.dart';
import 'package:eshare/services/copy_link.dart';
import 'package:flutter/material.dart';

class ManageAccessScreen extends StatefulWidget {
  final String? url;
  final String shortUrl;
  final String name;
  final String modifiedDate;
  final String size;

  const ManageAccessScreen({
    super.key,
    required this.shortUrl,
    required this.name,
    required this.modifiedDate,
    required this.size,
    this.url,
  });

  @override
  State<ManageAccessScreen> createState() => _ManageAccessScreenState();
}

class _ManageAccessScreenState extends State<ManageAccessScreen> {
  bool expirationEnabled = false;
  bool passwordRequired = false;
  bool disableDownloads = false;
  String accessControl = "Only people invited";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Manage Access")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Modified: ${widget.modifiedDate}"),
              Text("Size: ${widget.size} KB"),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("People with this link can view"),
                  TextButton(
                    onPressed: () {
                      copyLink(widget.shortUrl, context);
                    },
                    child:
                        Text("Copy link", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              const Divider(),
              ListTile(
                title: Text("Who has access"),
                subtitle: Text(accessControl),
                trailing: DropdownButton<String>(
                  value: accessControl,
                  onChanged: (String? newValue) {
                    setState(() {
                      accessControl = newValue!;
                    });
                  },
                  items: ["Only people invited", "Anyone with link"]
                      .map((value) =>
                          DropdownMenuItem(value: value, child: Text(value)))
                      .toList(),
                ),
              ),
              SwitchListTile(
                title: Text("Expiration"),
                subtitle: Text("Disable this link on a specific date"),
                value: expirationEnabled,
                onChanged: (bool value) {
                  setState(() {
                    expirationEnabled = value;
                  });
                },
              ),
              ExpirationPicker(
                expirationEnabled: expirationEnabled,
              ),
              SwitchListTile(
                title: Text("Require password"),
                subtitle: Text("Set a password to limit access"),
                value: passwordRequired,
                onChanged: (bool value) {
                  setState(() {
                    passwordRequired = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Disable downloads"),
                subtitle: Text("Prevent people from downloading"),
                value: disableDownloads,
                onChanged: (bool value) {
                  setState(() {
                    disableDownloads = value;
                  });
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
