import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
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
          expandedHeight: 70.0,
          floating: false,
          snap: false,
          elevation: 0.0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.fromLTRB(66.0, 8.0, 16.0, 8.0),
            title: Text(
              taskList.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
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
          Padding(
            padding: (pendingTaskList.isNotEmpty)
                ? const EdgeInsets.only(top: 8.0)
                : EdgeInsets.zero,
            child: const Divider(
              height: .0,
              thickness: 1.0,
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
