import 'package:flutter/material.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/tlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListItem extends StatelessWidget {
  final Tlist taskList;
  final bool active;
  const TaskListItem({
    Key? key,
    required this.taskList,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeBloc>().add(HomeEvent.updateActiveTaskList(taskList));
        Navigator.pop(context);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: active
              ? Theme.of(context).accentColor.withOpacity(0.35)
              : Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.0),
            bottomRight: Radius.circular(24.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(60.0, 16.0, 8.0, 16.0),
          child: Text(
            taskList.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              fontSize: 13.0,
              color:
                  active ? Theme.of(context).accentColor : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
