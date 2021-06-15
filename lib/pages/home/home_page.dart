import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/home/widgets/home_view.dart';
import 'package:tasks/pages/home/widgets/main_menu.dart';
import 'package:tasks/pages/home/widgets/more_menu.dart';
import 'package:tasks/pages/home/widgets/new_task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            elevation: 3.0,
            child: Image.asset('assets/images/plus.png'),
            onPressed: () => _addNewTask(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            elevation: 8.0,
            shape: CircularNotchedRectangle(),
            notchMargin: 6.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.grey.shade600,
                  onPressed: () =>
                      _showMainMenu(state.taskLists, state.activeTaskList!),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  color: Colors.grey.shade600,
                  onPressed: () => _showMoreMenu(),
                )
              ],
            ),
          ),
          body: state.activeTaskList == null
              ? const Center(child: CircularProgressIndicator())
              : HomeView(taskList: state.activeTaskList!),
        );
      },
    );
  }

  void _addNewTask() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => NewTask(),
    );
  }

  void _showMainMenu(
    List<Tlist> taskLists,
    Tlist activeTaskList,
  ) =>
      showModalBottomSheet(
        context: context,
        builder: (_) => MainMenu(),
      );

  void _showMoreMenu() => showModalBottomSheet(
        context: context,
        builder: (_) => MoreMenu(),
      );
}
