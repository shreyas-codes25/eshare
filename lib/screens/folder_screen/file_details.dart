import 'package:flutter/material.dart';

class FileDetails extends StatefulWidget {
  const FileDetails({super.key});

  @override
  State<FileDetails> createState() => _FileDetailsState();
}

class _FileDetailsState extends State<FileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text("File Details"),
          ),
          SizedBox(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text("Share"),
                  onTap: () {
                    // Share file
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Delete"),
                  onTap: () {
                    // Delete file
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
