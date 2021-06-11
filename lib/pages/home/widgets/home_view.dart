import 'package:flutter/material.dart';
import 'package:tasks/models/sort_by.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/home/widgets/completed_section.dart';
import 'package:tasks/pages/home/widgets/task_item.dart';
import 'package:date_time_format/date_time_format.dart';

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
            titlePadding: EdgeInsets.fromLTRB(58.0, 8.0, 16.0, 8.0),
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
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: pendingTaskList.length,
              itemBuilder: (_, index) => Wrap(
                children: [
                  if (taskList.sortBy == SortBy.Date)
                    if (pendingTaskList[index].dateTime != null &&
                        (index == 0 ||
                            pendingTaskList[index].dateTime !=
                                pendingTaskList[index - 1].dateTime))
                      _dateCategoryTitle(
                          pendingTaskList[index].dateTime!.format('D, M j'))
                    else if (pendingTaskList[index].dateTime == null &&
                        (index == 0 ||
                            pendingTaskList[index - 1].dateTime != null))
                      _dateCategoryTitle('No due date'),
                  TaskItem(
                    key: Key(pendingTaskList[index].id),
                    taskList: taskList,
                    task: pendingTaskList[index],
                    viewDate: !(taskList.sortBy == SortBy.Date),
                  ),
                ],
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

  Widget _dateCategoryTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 16.0, 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
