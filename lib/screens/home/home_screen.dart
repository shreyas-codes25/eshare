import 'package:eshare/helper/prefs_helper.dart';
import 'package:eshare/models/drive_data_model.dart';

import 'package:eshare/services/format.dart';
import 'package:eshare/services/get_drive.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.response});

  final Future<List<DriveData>>? response;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<DriveData>> response;

  @override
  void initState() {
    if (widget.response != null) {
      response = widget.response!;
    } else {
      response = getDriveData("", "");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home "),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await PrefsHelper().clearSharedPreferences(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<DriveData>>(
            future: response,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No data found');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        snapshot.data![index].name.endsWith("/")
                            ? Icons.folder // Folder icon
                            : Icons.insert_drive_file, // File icon
                        color: snapshot.data![index].name.endsWith("/")
                            ? Colors.amber
                            : Colors.blueGrey,
                        size: 30,
                      ),
                      title: Text(
                        snapshot.data![index].name
                            .replaceAll("/", ""), // Removing trailing "/"
                        style: TextStyle(fontWeight: FontWeight.w500),
                        overflow:
                            TextOverflow.ellipsis, // Prevents text overflow
                      ),
                      subtitle: Text(
                        "${formatSize(snapshot.data![index].size)}  •  ${formatDate(snapshot.data![index].modifiedDate)}",
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                      ), // 3-dot menu for options
                      onTap: () {
                        if (snapshot.data![index].name.endsWith("/")) {
                          print(snapshot.data![index].name);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                  response: getDriveData(
                                      snapshot.data![index].name, null)),
                            ),
                          );
                        } else {
                          // Open file
                        }
                      },
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
