import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/pages/home/widgets/task_list_item.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.taskLists != current.taskLists ||
              previous.activeTaskList != current.activeTaskList,
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(.0, 16.0, 8.0, 16.0),
              itemCount: state.taskLists.length,
              itemBuilder: (context, index) => TaskListItem(
                taskList: state.taskLists[index],
                active: state.taskLists[index].id == state.activeTaskList!.id,
              ),
            );
          },
        ),
        const Divider(
          height: .0,
          thickness: 2.0,
        ),
        _createNewListBtn(context),
      ],
    );
  }

  Widget _createNewListBtn(BuildContext context) => InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/newList');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.add,
                  size: 20.0,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                "Create new list",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  fontSize: 13.0,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      );
}
