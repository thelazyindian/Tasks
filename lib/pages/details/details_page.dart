import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/details/widgets/details_view.dart';

class DetailsPage extends StatelessWidget {
  final Tlist activeTaskList;
  final Task task;
  const DetailsPage({
    required this.activeTaskList,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey.shade700,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(CommunityMaterialIcons.delete_outline),
              color: Colors.grey.shade700,
            ),
          ),
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: DetailsView(
        activeTaskList: activeTaskList,
        task: task,
      ),
    );
  }
}
