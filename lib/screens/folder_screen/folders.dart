import 'package:eshare/models/drive_data_model.dart';
import 'package:eshare/screens/folder_screen/list_tile.dart';
import 'package:eshare/services/get_drive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

class Folders extends StatefulWidget {
  const Folders({super.key, this.response, this.breadCrumbs});

  final Future<List<DriveData>>? response;
  final List<String>? breadCrumbs;

  @override
  State<Folders> createState() => _FoldersState();
}

class _FoldersState extends State<Folders> {
  late Future<List<DriveData>> response;
  late List<String> breadCrumbs = [];

  @override
  void initState() {
    if (widget.response != null) {
      response = widget.response!;
      breadCrumbs = widget.breadCrumbs ?? ["My Drive"];
    } else {
      response = getDriveData("", "", context);
      breadCrumbs.add("My Drive");
    }
    super.initState();
  }

  void _updateFolder(String folderName) {
    setState(() {
      breadCrumbs.add(folderName);
      String folderPath =
          breadCrumbs.length > 1 ? breadCrumbs.sublist(1).join("/") : "";
      response = getDriveData(folderPath, null, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BreadCrumb.builder(
              divider: Icon(Icons.chevron_right),
              itemCount: breadCrumbs.length,
              builder: (index) {
                return BreadCrumbItem(
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      breadCrumbs[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      response = getDriveData("", "", context);
                      breadCrumbs = breadCrumbs.sublist(0, index + 1);
                    });
                  },
                );
              },
            ),
            Expanded(
              child: FutureBuilder<List<DriveData>>(
                future: response,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No data found'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTileWidget(
                          name: snapshot.data![index].name,
                          url: snapshot.data![index].url,
                          modifiedDate: snapshot.data![index].modifiedDate,
                          size: snapshot.data![index].size,
                          breadCrumbs: breadCrumbs,
                          onFolderTap: _updateFolder,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
