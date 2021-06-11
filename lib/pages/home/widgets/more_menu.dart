import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/sort_by.dart';
import 'package:tasks/pages/home/widgets/sort_by_dialog.dart';
import 'package:tasks/pages/new_list/new_list_page.dart';

class MoreMenu extends StatelessWidget {
  const MoreMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskList = context.read<HomeBloc>().state.activeTaskList!;
    final hasCompletedTasks =
        taskList.tasks.where((element) => element.completed).length > 0;
    final hasMoreThanOneList =
        context.read<HomeBloc>().state.taskLists.length > 1;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: <Widget>[
          ListTile(
            title: const Text(
              'Sort By',
              style: TextStyle(fontSize: 13.0),
            ),
            subtitle: Text(
              sortByString[taskList.sortBy]!,
              style: TextStyle(fontSize: 12.0),
            ),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) => SortByDialog(),
              );
            },
          ),
          const Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          ListTile(
            title: const Text(
              'Rename List',
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => NewListPage(taskList: taskList)),
              );
            },
          ),
          ListTile(
            title: Text(
              'Delete List',
              style: TextStyle(fontSize: 13.0),
            ),
            enabled: hasMoreThanOneList,
            onTap: () {
              context.read<HomeBloc>().add(HomeEvent.removeTaskList());
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(
              'Delete all completed tasks',
              style: TextStyle(fontSize: 13.0),
            ),
            enabled: hasCompletedTasks,
            onTap: () {
              context.read<HomeBloc>().add(HomeEvent.deleteCompletedTasks());
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
