import 'package:flutter/material.dart';

// import '../data/database_helper.dart';
import '../model/task.dart';
import '../pages/new_list_page.dart';
import '../pages/rename_list_page.dart';
import '../pages/task_details.dart';
import '../pages/add_task.dart';
import '../widgets/date_widget.dart';
import '../data/data_handler.dart';
import '../containers/bottom_sheet/more.dart';
import '../containers/lists/completed.dart';

import '../containers/bottom_sheet/menu.dart';

class TasksHomePage extends StatefulWidget {
  @override
  _TasksHomePageState createState() => _TasksHomePageState();
}

enum DetailsWidgetStatus { OPEN, CLOSE }

int taskDetailId;
final List<Task> pendingTaskList = List();
final List<Task> completedTaskList = List();
AnimationController detailsTapAnimationController;
final _duration = Duration(milliseconds: 300);
DetailsWidgetStatus _detailsWidgetStatus = DetailsWidgetStatus.CLOSE;
// Future _bottomSheet;
List<String> tblNames = List();
String listName = "";
String activeList = "";
String defaultListName = "My Tasks";
// StatefulBuilder _builder;
SortBy _sort = SortBy.custom;
StateSetter setSheetState;
bool details = false;

class _TasksHomePageState extends State<TasksHomePage>
    with TickerProviderStateMixin {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    activeList = "My Tasks"; // Default List
    listName = activeList;
    defaultListName = activeList;
    detailsTapAnimationController =
        AnimationController(duration: _duration, vsync: this);
    detailsTapAnimationController.addListener(() {
      setSheetState(() {
        print("Animation: ${detailsTapAnimationController.value.toDouble()}");
        // _bottomSheet;
      });
    });
    _getTables();
  }

  dispose() {
    super.dispose();
    detailsTapAnimationController.dispose();
  }

  void _dismissTask(int index, Task item) {
    print(index);
    completedTaskList.add(pendingTaskList[index]);
    pendingTaskList.removeAt(index);
    /*showSnackBar(
        SnackBar(
          content:
              Text("${pendingTaskList.length} completed!"),
        ),
    );*/
    updateTaskStatus(item);
    _getTasks();
  }

  @override
  Widget build(BuildContext context) {
    // _builder = StatefulBuilder(
    //   builder: (BuildContext context, kek) {
    //     print(kek);
    //     return Text('');
    //   },
    // );
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Add a new task', maxLines: 1),
        onPressed: () {
          showModalBottomSheet<Task>(
              // TODO: Go To Definition of bottom_sheet.dart
              // Replace with contents to use: https://gist.github.com/slightfoot/5af4c5dfa52194a3f8577bf83af2e391
              context: context,
              // resizeToAvoidBottomPadding: true,
              builder: (BuildContext context) {
                return AddTaskWidget();
              }).then((newTask) {
            if (newTask == null || newTask.title.isNotEmpty)
              onNewTaskSave(newTask);
          });
        }, //_newTaskModalBottomSheet,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 25.0,
        // hasNotch: false,
        // shape: CircularNotchedRectangle(),
        // notchMargin: 4.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: _modalBottomSheetMenu,
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: _modalBottomSheetMore,
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 85.0,
              floating: false,
              snap: false,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: (listName != "" && listName != null)
                    ? Text(
                        listName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : Text(""),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List<Dismissible>.generate(
                  pendingTaskList.length,
                  (int index) {
                    final item = pendingTaskList[index];
                    return Dismissible(
                      direction: DismissDirection.startToEnd,
                      key: Key(item.id.toString()),
                      onDismissed: (direction) => _dismissTask(index, item),
                      background: Container(
                        color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            // padding: EdgeInsets.only(
                            //   left: 5.0,
                            //   right: 5.0,
                            // ),
                            child: ListTile(
                              onTap: () async {
                                var route = MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return TaskDetailsPage(listName, item.id);
                                });
                                var detailsPage =
                                    await Navigator.of(context).push(route);
                                if (detailsPage == null) {
                                  _getTasks();
                                }
                              },
                              leading: IconButton(
                                icon: Icon(Icons.radio_button_unchecked),
                                onPressed: () => _dismissTask(index, item),
                              ),
                              title: Text(item?.title ?? ""),
                              subtitle: item?.subtitle == null ||
                                      (item?.subtitle?.isEmpty ?? true)
                                  ? null
                                  : Text(item.subtitle),
                            ),
                          ),
                          pendingTaskList[index].date != null
                              ? ListTile(
                                  leading: Icon(Icons.info,
                                      color: Colors.transparent),
                                  title: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      DateViewWidget(date: item.date)
                                    ],
                                  ),
                                )
                              : Container(height: 0.0),
                          Divider(
                            height: 1.0,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            // completedList(),
            CompletedList(items: completedTaskList),
          ],
        ),
      ),
    );
  }

  void onTapUp(TapUpDetails tap) {
    if (_detailsWidgetStatus == DetailsWidgetStatus.CLOSE) {
      print("OPEN");
      detailsTapAnimationController.forward(from: 0.0);
      _detailsWidgetStatus = DetailsWidgetStatus.OPEN;
    } else {
      print("CLOSE");
      detailsTapAnimationController.reverse(from: 1.0);
      _detailsWidgetStatus = DetailsWidgetStatus.CLOSE;
    }
    setState(() {});
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        // resizeToAvoidBottomPadding: true,
        context: context,
        builder: (builder) {
          return MenuWidget(
            listNames: tblNames,
            createList: () async {
              Navigator.pop(context);
              var newListPage = await Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return NewListPage();
              }));
              if (newListPage == null) {
                _getTables();
              }
            },
            activeList: activeList,
            listChange: (String value) {
              listName = value;
              activeList = listName;
              _getTasks();
            },
          );
        });
  }

  void _modalBottomSheetMore() {
    showModalBottomSheet(
      // resizeToAvoidBottomPadding: true,
      context: context,
      builder: (builder) {
        return MoreWidget(
          sort: _sort,
          sortChanged: (SortBy value) {
            setState(() {
              _sort = value;
            });
            _sortList(_sort);
          },
          completedTasksCount: completedTaskList?.length,
          canDelete: activeList != tblNames[0],
          renameList: () async {
            Navigator.pop(context);
            var renameListPage = await Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return RenameListPage(activeList);
            }));
            if (renameListPage == null) {
              _getTables();
            }
          },
          deleteList: () async {
            if (tblNames.length > 1 && activeList != defaultListName) {
              Navigator.pop(context);
              // await DatabaseHelper.get().deleteTable(activeList);

              removeList(listName);
              tblNames.remove(listName);
              setState(() {
                activeList = defaultListName;
                listName = activeList;
                _getTasks();
              });
            }
          },
          deleteCompletedTasks: () async {
            // await DatabaseHelper.get().deleteCompletedTask(activeList);
            clearCompletedTasks(activeList);
            _getTasks();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void onNewTaskSave(Task task) {
    if (task != null) {
      // var db = DatabaseHelper();
      // db.saveTask(task, activeList);
      // //Navigator.pop(context);
      var _task = task;
      _task.status = "PENDING";
      addTask(task, listName: activeList);
      print("Task saved!");
      print("${task.title}");
      _getTasks();
    } else {
      print("Empty field!");
    }
  }

  void _sortList(SortBy sort) {
    pendingTaskList.sort((Task a, Task b) {
      if (sort == SortBy.date) {
        return a.date.millisecondsSinceEpoch
            .compareTo(b.date.millisecondsSinceEpoch);
      }
      return a.title.compareTo(b.title);
    });
    completedTaskList.sort((Task a, Task b) {
      if (sort == SortBy.date) {
        return a.date.millisecondsSinceEpoch
            .compareTo(b.date.millisecondsSinceEpoch);
      }
      return a.title.compareTo(b.title);
    });
    setState(() {
      print("List Sorted!");
    });
  }

  void updateTaskStatus(Task task) {
    // var db = DatabaseHelper();
    // db.updateTask(task, activeList);
    var _task = task;
    _task.status = "COMPLETED";
    updateTask(task.id, _task, listName: activeList);
    print('Update Task');
  }

  void _getTasks() {
    print("Getting Tasks for: $listName");
    var pendingTasks = getTasksByStatus("PENDING", listName: listName) ?? [];
    print("Pending Tasks: " + pendingTasks?.length.toString());
    setState(() {
      pendingTaskList?.clear();
      pendingTaskList?.addAll(pendingTasks);
      //print(tasks.toString());
    });
    var completedTasks =
        getTasksByStatus("COMPLETED", listName: listName) ?? [];
    print("Completed Tasks: " + completedTasks?.length.toString());
    setState(() {
      completedTaskList?.clear();
      completedTaskList?.addAll(completedTasks);
      //print(tasks.toString());
    });
    // print("Running _getTasks()");
    // if (listName != null && listName != "") {
    //   var dbClient = DatabaseHelper();
    //   dbClient.getTasksByStatus(listName, "PENDING").then((tasks) {
    //     if (tasks == null) return;
    //     setState(() {
    //       pendingTaskList.clear();
    //       pendingTaskList.addAll(tasks);
    //       //print(tasks.toString());
    //     });
    //   });

    //   dbClient.getTasksByStatus(listName, "COMPLETED").then((tasks) {
    //     if (tasks == null) return;
    //     setState(() {
    //       completedTaskList.clear();
    //       completedTaskList.addAll(tasks);
    //       //print(tasks.toString());
    //     });
    //   });
    // } else {
    //   print("var listName is null");
    // }
  }

  void _getTables() {
    print("Getting tables...");
    var tableNames = getLists();
    if (tableNames != null) {
      tblNames.clear();
      for (var item in tableNames) {
        setState(() {
          print(item.name);
          tblNames.add(item.name);
        });
      }
      if (tableNames == null || tableNames.isEmpty) {
        setState(() {
          var item = "My Tasks";
          print(item);
          tblNames.add(item);
        });
      }
      // activeList = tblNames[0];
      // listName = tblNames[0];
      // defaultListName = tblNames[0];
      _getTasks();
    } else {
      print("getTables returned null");
    }
    _getTasks();
    // DatabaseHelper.get().getTables().then((tableNames) {
    //   if (tableNames != null) {
    //     tblNames.clear();
    //     for (String item in tableNames) {
    //       setState(() {
    //         print(item);
    //         tblNames.add(item);
    //       });
    //     }
    //     activeList = tblNames[0];
    //     listName = tblNames[0];
    //     defaultListName = tblNames[0];
    //     _getTasks();
    //   } else
    //     print("getTables returned null");
    // });
  }
}
