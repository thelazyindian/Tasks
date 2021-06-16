import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/application/theme/theme_cubit.dart';
import 'package:tasks/models/sort_by.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/home/widgets/completed_section.dart';
import 'package:tasks/pages/home/widgets/task_item.dart';
import 'package:date_time_format/date_time_format.dart';

class HomeView extends StatelessWidget {
  final Tlist taskList;

  const HomeView({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Task> pendingTaskList =
        taskList.tasks.where((element) => !element.completed).toList();
    final List<Task> completedTaskList =
        taskList.tasks.where((element) => element.completed).toList();

    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
        bottom: 32.0,
      ),
      children: [
        _appBar(),
        if (pendingTaskList.isEmpty && completedTaskList.isEmpty)
          _emptyTasksView(context),
        if (pendingTaskList.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: pendingTaskList.length,
            itemBuilder: (_, index) => Wrap(
              children: [
                if (taskList.sortBy == SortBy.Date)
                  if (pendingTaskList[index].dateTime != null &&
                      (index == 0 ||
                          pendingTaskList[index].dateTime !=
                              pendingTaskList[index - 1].dateTime))
                    _dateCategoryTitle(context,
                        pendingTaskList[index].dateTime!.format('D, M j'))
                  else if (pendingTaskList[index].dateTime == null &&
                      (index == 0 ||
                          pendingTaskList[index - 1].dateTime != null))
                    _dateCategoryTitle(context, 'No due date'),
                TaskItem(
                  key: Key(pendingTaskList[index].id),
                  taskList: taskList,
                  task: pendingTaskList[index],
                  viewDate: !(taskList.sortBy == SortBy.Date),
                ),
              ],
            ),
          ),
        if (pendingTaskList.isNotEmpty && completedTaskList.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: const Divider(
              height: .0,
              thickness: 1.0,
            ),
          ),
        if (completedTaskList.isNotEmpty)
          CompletedSection(
            taskList: taskList,
            tasks: completedTaskList,
          ),
      ],
    );
  }

  Widget _appBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(58.0, 16.0, 16.0, 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              taskList.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                color: Theme.of(context).primaryIconTheme.color,
                icon: Icon(
                  state.map(
                    light: (_) => CommunityMaterialIcons.weather_night,
                    dark: (_) => CommunityMaterialIcons.white_balance_sunny,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _dateCategoryTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 16.0, 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
    );
  }

  Widget _emptyTasksView(BuildContext context) => Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height -
            kBottomNavigationBarHeight -
            80.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FractionallySizedBox(
              widthFactor: 0.7,
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (_, state) => Image.asset(
                  state.map(
                    light: (_) => 'assets/images/chilling_light.png',
                    dark: (_) => 'assets/images/chilling_dark.png',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'A fresh start',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Anything to add?',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      );
}
