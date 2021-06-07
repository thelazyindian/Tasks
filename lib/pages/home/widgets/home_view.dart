import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/details/details_page.dart';
import 'package:tasks/pages/home/widgets/completed_section.dart';

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

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 75.0,
          floating: false,
          snap: false,
          elevation: 0.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              taskList.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            List<Dismissible>.generate(
              pendingTaskList.length,
              (int index) {
                final item = pendingTaskList[index].name;
                return Dismissible(
                  direction: DismissDirection.startToEnd,
                  key: Key(item),
                  onDismissed: (direction) {},
                  background: Container(
                    color: Colors.blue,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: ListTile(
                          onTap: () async {
                            var route = MaterialPageRoute(
                                builder: (BuildContext context) {
                              return DetailsPage(taskList.name, 0);
                            });
                            var detailsPage =
                                await Navigator.of(context).push(route);
                            if (detailsPage == null) {
                              // _getTasks();
                            }
                          },
                          leading: Icon(Icons.radio_button_unchecked),
                          title: (pendingTaskList[index].name != null)
                              ? Text(pendingTaskList[index].name)
                              : Text(""),
                          subtitle: Text(pendingTaskList[index].details ?? ''),
                        ),
                      ),
                      const Divider(height: 1.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        CompletedSection(
          taskList: taskList,
          tasks: completedTaskList,
        ),
      ],
    );
  }
}
