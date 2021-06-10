import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/home/widgets/task_item.dart';

class CompletedSection extends StatelessWidget {
  final Tlist taskList;
  final List<Task> tasks;
  const CompletedSection({
    Key? key,
    required this.tasks,
    required this.taskList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          'Completed (${tasks.length})',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      iconColor: Colors.grey.shade700,
      textColor: Colors.grey.shade700,
      collapsedTextColor: Colors.grey.shade700,
      collapsedIconColor: Colors.grey.shade700,
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemCount: tasks.length,
          padding: EdgeInsets.zero,
          itemBuilder: (_, index) => TaskItem(
            key: Key(tasks[index].id),
            taskList: taskList,
            task: tasks[index],
          ),
        ),
      ],
    );
  }
}
