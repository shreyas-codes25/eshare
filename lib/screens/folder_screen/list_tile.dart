import 'package:eshare/services/format.dart';

import 'package:eshare/services/open_file.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatefulWidget {
  final String? name;
  final String? url;
  final String? modifiedDate;
  final int? size;
  final List<String> breadCrumbs;
  final Function(String folderName)? onFolderTap;

  const ListTileWidget(
      {super.key,
      required this.name,
      required this.url,
      required this.modifiedDate,
      required this.size,
      required this.breadCrumbs,
      this.onFolderTap});

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!, width: 0.5),
          bottom: BorderSide(color: Colors.grey[300]!, width: 0.5),
        ),
      ),
      child: ListTile(
        leading: Icon(
          widget.name!.endsWith("/") ? Icons.folder : Icons.insert_drive_file,
          color: widget.name!.endsWith("/") ? Colors.amber : Colors.blueGrey,
          size: 25,
        ),
        title: Text(
          widget.name!.replaceAll("/", ""),
          style: TextStyle(fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          "${formatSize(widget.size!)}  •  ${formatDate(widget.modifiedDate!)}",
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        trailing: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
        onTap: () async {
          if (widget.name!.endsWith("/")) {

            widget.onFolderTap
                ?.call(widget.name!.replaceAll("/", "")); // Call callback
          } else {
            setState(() {
              isLoading = true;
            });

            openFile(widget.url);
            await Future.delayed(Duration(seconds: 4));

            setState(() {
              isLoading = false;
            });
          }
        },
      ),
    );
  }
}
