import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/details/details_page.dart';

class CompletedSection extends StatelessWidget {
  final Tlist taskList;
  final List<Task> tasks;
  const CompletedSection(
      {Key? key, required this.tasks, required this.taskList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tasks.isNotEmpty) {
      return SliverToBoxAdapter(
        child: ExpansionTile(
          title: Text(
            'Completed (${tasks.length})',
          ),
          backgroundColor: Colors.white,
          children: <Widget>[
            Container(
              height: 68.0 * tasks.length,
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: ListTile(
                          onTap: () async {
                            final route = MaterialPageRoute(
                                builder: (_) => DetailsPage(
                                      activeTaskList: taskList,
                                      task: tasks[index],
                                    ));
                            final detailsPage =
                                await Navigator.of(context).push(route);
                          },
                          leading: Icon(
                            Icons.check,
                            color: Colors.blue,
                          ),
                          title: Text(
                            tasks[index].name,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 1.0),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
    return SliverFillRemaining();
  }
}
