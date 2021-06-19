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
        padding: const EdgeInsets.only(left: 12.0),
        child: Text(
          'Completed (${tasks.length})',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).secondaryHeaderColor,
      textColor: Theme.of(context).secondaryHeaderColor,
      collapsedTextColor: Theme.of(context).secondaryHeaderColor,
      collapsedIconColor: Theme.of(context).secondaryHeaderColor,
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: tasks.length,
          padding: EdgeInsets.zero,
          itemBuilder: (_, index) => TaskItem(
            key: Key('${tasks[index].id}'),
            taskList: taskList,
            task: tasks[index],
          ),
        ),
      ],
    );
  }
}
