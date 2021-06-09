import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/details/details_page.dart';
import 'package:tasks/pages/home/widgets/completed_section.dart';
import 'package:tasks/pages/home/widgets/task_item.dart';

class HomeView extends StatelessWidget {
  final Tlist taskList;

  const HomeView({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Task> pendingTaskList =
        taskList.tasks.where((element) => !element.completed).toList();
    final List<Task> completedTaskList =
        taskList.tasks.where((element) => element.completed).toList();

    return NestedScrollView(
      headerSliverBuilder: (_, __) => [
        SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 60.0,
          floating: false,
          snap: false,
          elevation: 0.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              taskList.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
      ],
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          if (pendingTaskList.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: pendingTaskList.length,
              itemBuilder: (_, index) => TaskItem(
                key: Key(pendingTaskList[index].id),
                taskList: taskList,
                task: pendingTaskList[index],
              ),
            ),
          if (completedTaskList.isNotEmpty)
            CompletedSection(
              taskList: taskList,
              tasks: completedTaskList,
            ),
        ],
      ),
    );
  }
}
