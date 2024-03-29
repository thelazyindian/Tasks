import 'package:community_material_icon/community_material_icon.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/sub_task.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/details/details_page.dart';
import 'package:tasks/utils/extensions.dart';

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
        Navigator.of(context).pushNamed('/details', arguments: task);
      },
      child: Dismissible(
        key: Key('${task.id}'),
        direction: task.completed
            ? DismissDirection.endToStart
            : DismissDirection.startToEnd,
        onDismissed: (_) => _toggleComplete(context),
        background: Container(color: Theme.of(context).accentColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
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
                          if (task.details?.isNotEmpty ?? false)
                            _detailsView(context),
                          if (!viewDate && task.timeOfDay != null ||
                              viewDate && task.dateTime != null)
                            _dateTimeView(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (task.subtasks.isNotEmpty)
              ...task.subtasks
                  .map((subTask) => _subtaskItemView(context, subTask))
                  .toList(),
          ],
        ),
      ),
    );
  }

  Widget _subtaskItemView(
    BuildContext context,
    SubTask subTask,
  ) =>
      Dismissible(
        key: Key(subTask.id),
        confirmDismiss: (_) async {
          _toggleSubTaskComplete(
            context,
            subTask,
          );
          return false;
        },
        direction: subTask.completed
            ? DismissDirection.endToStart
            : DismissDirection.startToEnd,
        background: Container(color: Theme.of(context).accentColor),
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
          color: completed
              ? Theme.of(context).accentColor
              : Theme.of(context).iconTheme.color,
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

  Widget _detailsView(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          task.details!,
          style: TextStyle(
            fontSize: 14.0,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      );

  Widget _dateTimeView() {
    final dateTime = DateTime(
      task.dateTime!.year,
      task.dateTime!.month,
      task.dateTime!.day,
      task.timeOfDay?.hour ?? 0,
      task.timeOfDay?.minute ?? 0,
    );
    final text = viewDate
        ? dateTime.getYTTorFormat('D, M j', task.timeOfDay != null)
        : dateTime.format('g:i A');

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 6.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade500,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _toggleComplete(BuildContext context) {
    context.read<HomeBloc>().add(task.completed
        ? HomeEvent.incompletedTask(task: task)
        : HomeEvent.completedTask(task: task));
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
