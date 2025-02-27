import 'package:eshare/services/share.dart';
import 'package:eshare/services/copy_link.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FileDetails extends StatefulWidget {
  const FileDetails(
      {super.key,
      required this.url,
      required this.name,
      required this.size,
      required this.modifiedDate});

  final String url;
  final String name;
  final String size;
  final String modifiedDate;

  @override
  State<FileDetails> createState() => _FileDetailsState();
}

class _FileDetailsState extends State<FileDetails> {
  bool offline = false;
  bool isSharing = false; // Track if sharing is in progress

  void _handleShare() async {
    setState(() {
      isSharing = true;
    });

    Fluttertoast.showToast(
      msg: "Sharing file...",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );

    try {
      await share(widget.url, widget.name); // Simulate file sharing

      Fluttertoast.showToast(
        msg: "File shared successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error sharing file!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }

    setState(() {
      isSharing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isSharing,
      child: Stack(
        children: [
          Container(
            height: 741,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Scaffold(
              bottomNavigationBar: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(height: 0),
                    ListTile(
                      leading: Icon(Icons.delete_forever, color: Colors.red),
                      title: Text(
                        "Delete",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(widget.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey)),
                          Text(
                            "${widget.size}\t\t${widget.modifiedDate}",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.share),
                            title: Text("Share"),
                            onTap: _handleShare,
                          ),
                          ListTile(
                            leading: Icon(Icons.settings),
                            title: Text("Manage Access"),
                            onTap: () {
                              // Manage access
                            },
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.cloud_download),
                            title: Text("Make available offline"),
                            trailing: Switch(
                              value: offline,
                              onChanged: (value) {
                                setState(() {
                                  offline = value;
                                });
                              },
                            ),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.star_border_outlined),
                            title: Text("star"),
                            onTap: () {
                              // Manage access
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.copy),
                            title: Text("Copy Link"),
                            onTap: () {
                              copyLink(widget.url, context);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.download),
                            title: Text("Save to device"),
                            onTap: () {
                              // Manage access
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.open_with),
                            title: Text("Move"),
                            onTap: () {
                              // Manage access
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text("remane"),
                            onTap: () {
                              // Manage access
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.print),
                            title: Text("print"),
                            onTap: () {
                              // Manage access
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isSharing)
            Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(3), // Dim the background
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
