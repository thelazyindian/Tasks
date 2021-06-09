import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/details/details_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Tlist taskList;
  const TaskItem({
    Key? key,
    required this.taskList,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) => _toggleComplete(context),
      background: Container(color: Colors.blue),
      child: InkWell(
        onTap: () {
          final route = MaterialPageRoute(
              builder: (_) => DetailsPage(
                    activeTaskList: taskList,
                    task: task,
                  ));
          Navigator.of(context).push(route);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => _toggleComplete(context),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    task.completed
                        ? CommunityMaterialIcons.check
                        : CommunityMaterialIcons.radiobox_blank,
                    color: task.completed
                        ? Theme.of(context).accentColor
                        : Colors.black54,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      task.name,
                      style: TextStyle(
                        fontSize: 16.0,
                        decoration: task.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    if (task.details != null)
                      Text(
                        task.details!,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black54,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleComplete(BuildContext context) {
    context.read<HomeBloc>().add(task.completed
        ? HomeEvent.incompletedTask(task)
        : HomeEvent.completedTask(task));
  }
}
