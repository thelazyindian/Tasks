import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/sub_task.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/details/details_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_time_format/date_time_format.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Tlist taskList;
  final bool viewDate;
  const TaskItem({
    Key? key,
    required this.taskList,
    required this.task,
    this.viewDate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final route =
            MaterialPageRoute(builder: (_) => DetailsPage(task: task));
        Navigator.of(context).push(route);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Dismissible(
            key: Key(task.id),
            direction: task.completed
                ? DismissDirection.endToStart
                : DismissDirection.startToEnd,
            onDismissed: (_) => _toggleComplete(context),
            background: Container(color: Colors.blue),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, .0, 16.0, .0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _toggleComplete(context),
                    child: _radioBtnView(context, task.completed),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _taskNameView(task.name, task.completed),
                          if (task.details?.isNotEmpty ?? false) _detailsView(),
                          if (task.dateTime != null && viewDate)
                            _dateTimeView(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (task.subtasks.isNotEmpty)
            ...task.subtasks
                .map((subTask) => _subtaskItemView(context, subTask))
                .toList(),
        ],
      ),
    );
  }

  Widget _subtaskItemView(
    BuildContext context,
    SubTask subTask,
  ) =>
      Dismissible(
        key: Key(subTask.id),
        direction: subTask.completed
            ? DismissDirection.endToStart
            : DismissDirection.startToEnd,
        onDismissed: (_) => _toggleSubTaskComplete(
          context,
          subTask,
        ),
        background: Container(color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(44.0, .0, 16.0, .0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => _toggleSubTaskComplete(
                  context,
                  subTask,
                ),
                child: _radioBtnView(context, subTask.completed),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: _taskNameView(
                    subTask.name ?? '',
                    subTask.completed,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _radioBtnView(
    BuildContext context,
    bool completed,
  ) =>
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          completed
              ? CommunityMaterialIcons.check
              : CommunityMaterialIcons.radiobox_blank,
          color: completed ? Theme.of(context).accentColor : Colors.black54,
          size: 20.0,
        ),
      );

  Widget _taskNameView(
    String name,
    bool completed,
  ) =>
      Text(
        name,
        style: TextStyle(
          fontSize: 16.0,
          decoration:
              completed ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      );

  Widget _detailsView() => Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          task.details!,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black54,
          ),
        ),
      );

  Widget _dateTimeView() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey.shade300),
        ),
        margin: const EdgeInsets.only(top: 8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 6.0),
        child: Text(
          task.dateTime!.format('D, M j'),
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  void _toggleComplete(BuildContext context) {
    context.read<HomeBloc>().add(task.completed
        ? HomeEvent.incompletedTask(task)
        : HomeEvent.completedTask(task));
  }

  void _toggleSubTaskComplete(
    BuildContext context,
    SubTask subTask,
  ) {
    context.read<HomeBloc>().add(subTask.completed
        ? HomeEvent.incompletedSubTask(task, subTask)
        : HomeEvent.completedSubTask(task, subTask));
  }
}
