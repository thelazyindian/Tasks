import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/application/details/details_bloc.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/pages/details/widgets/details_view.dart';

class DetailsPage extends StatelessWidget {
  final Task task;
  const DetailsPage({
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final detailsBloc = DetailsBloc(DetailsState(
      taskLists: context.read<HomeBloc>().state.taskLists,
      activeTaskList: context.read<HomeBloc>().state.activeTaskList!,
      task: task,
    ));

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.read<HomeBloc>().add(HomeEvent.updateTask(
                  taskListId: detailsBloc.state.activeTaskList.id,
                  task: detailsBloc.state.task,
                ));
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                context.read<HomeBloc>().add(HomeEvent.deleteTask(
                      taskListId: detailsBloc.state.activeTaskList.id,
                      task: task,
                    ));
                Navigator.pop(context);
              },
              icon: Icon(CommunityMaterialIcons.delete_outline),
            ),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          context.read<HomeBloc>().add(HomeEvent.updateTask(
                taskListId: detailsBloc.state.activeTaskList.id,
                task: detailsBloc.state.task,
              ));
          return true;
        },
        child: BlocProvider.value(
          value: detailsBloc,
          child: DetailsView(task: task),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50.0,
        child: Material(
          color: Theme.of(context).bottomAppBarColor,
          shadowColor: Colors.black,
          elevation: 32.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    final taskListId = detailsBloc.state.activeTaskList.id;
                    context.read<HomeBloc>().add(task.completed
                        ? HomeEvent.incompletedTask(
                            taskListId: taskListId,
                            task: detailsBloc.state.task,
                          )
                        : HomeEvent.completedTask(
                            taskListId: taskListId,
                            task: detailsBloc.state.task,
                          ));
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Mark ${task.completed ? 'uncompleted' : 'completed'}',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
