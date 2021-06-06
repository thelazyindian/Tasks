import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/pages/details/details_page.dart';

class HomeView extends StatelessWidget {
  final String listTitle;
  final List<Task> pendingTaskList;
  final List<Task> completedTaskList;

  const HomeView({
    Key? key,
    required this.listTitle,
    required this.pendingTaskList,
    required this.completedTaskList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              listTitle,
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
                  onDismissed: (direction) {
                    // print(index);
                    // completedTaskList.add(pendingTaskList[index]);
                    // pendingTaskList.removeAt(index);
                    // updateTaskStatus(item);
                    // _getTasks();
                  },
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
                              return DetailsPage(listTitle, 0);
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
        // completedList(),
      ],
    );
  }
}
