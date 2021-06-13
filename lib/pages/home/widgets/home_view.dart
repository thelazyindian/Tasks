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

    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
        bottom: 32.0,
      ),
      children: [
        _appBar(),
        if (pendingTaskList.isEmpty && completedTaskList.isEmpty)
          _emptyTasksView(context),
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
        if (pendingTaskList.isNotEmpty && completedTaskList.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
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
    );
  }

  Widget _appBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(58.0, 16.0, 16.0, 16.0),
      child: Text(
        taskList.name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 28.0,
          fontWeight: FontWeight.w100,
        ),
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

  Widget _emptyTasksView(BuildContext context) => Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height -
            kBottomNavigationBarHeight -
            80.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/chilling.png',
              height: 230.0,
              width: 230.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              'A fresh start',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Anything to add?',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      );
}
