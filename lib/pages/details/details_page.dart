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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey.shade700,
          ),
          onPressed: () {
            context
                .read<HomeBloc>()
                .add(HomeEvent.updateTask(detailsBloc.state.task));
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                context.read<HomeBloc>().add(HomeEvent.deleteTask(task));
                Navigator.pop(context);
              },
              icon: Icon(CommunityMaterialIcons.delete_outline),
              color: Colors.grey.shade700,
            ),
          ),
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: WillPopScope(
        onWillPop: () async {
          context
              .read<HomeBloc>()
              .add(HomeEvent.updateTask(detailsBloc.state.task));
          return true;
        },
        child: BlocProvider.value(
          value: detailsBloc,
          child: DetailsView(task: task),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 32.0,
        shadowColor: Colors.black,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  context.read<HomeBloc>().add(task.completed
                      ? HomeEvent.incompletedTask(detailsBloc.state.task)
                      : HomeEvent.completedTask(detailsBloc.state.task));
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
    );
  }
}
