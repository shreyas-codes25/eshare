import 'package:eshare/models/drive_data_model.dart';
import 'package:eshare/screens/folder_screen/list_tile.dart';
import 'package:eshare/services/folder_services.dart';
import 'package:eshare/services/get_drive.dart';
import 'package:eshare/widgets/app_bar.dart';
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
      breadCrumbs.add("Drive");
    }
    super.initState();
  }

  void _handleUpdateFolder(String folderName) {
    updateFolder(folderName, breadCrumbs, context).then((data) {
      setState(() {
        response = Future.value(data);
      });
    });
  }

  void _handleRefreshFolder() {
    refreshCurrentFolder(breadCrumbs, context).then((data) {
      setState(() {
        response = Future.value(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("My Folders", context),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: BreadCrumb.builder(
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
                                breadCrumbs = breadCrumbs.sublist(0, index + 1);
                                String folderPath = breadCrumbs.length > 1
                                    ? breadCrumbs.sublist(1).join("/")
                                    : "";
                                response =
                                    getDriveData(folderPath, null, context);
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh, color: Colors.blueAccent),
                    onPressed: _handleRefreshFolder,
                  ),
                ],
              ),
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
                          onFolderTap: _handleUpdateFolder,
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
