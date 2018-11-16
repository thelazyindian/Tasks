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
import '../containers/lists/pending.dart';
import '../containers/app_bar/main_list.dart';

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
              // ^^^ TODO: Go To Definition of showModalBottomSheet (bottom_sheet.dart)
              // Replace with contents with => https://gist.github.com/slightfoot/5af4c5dfa52194a3f8577bf83af2e391
              context: context,
              // resizeToAvoidBottomPadding: true, // <= Uncomment after rebuild and restart
              builder: (BuildContext context) {
                return AddTaskWidget();
              }).then((newTask) {
            if (newTask == null || newTask.title.isNotEmpty)
              onNewTaskSave(newTask);
          });
        },
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
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              MainListAppBar(name: listName),
              PendingList(
                items: pendingTaskList,
                dismissedTask: (Task task) {
                  completedTaskList.add(task);
                  pendingTaskList.remove(task);
                  updateTaskStatus(task);
                  _getTasks();
                },
                listRefresh: () {
                  _getTasks();
                },
                listName: activeList,
              ),
              CompletedList(items: completedTaskList),
            ],
          ),
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
            if (renameListPage != null) {
              tblNames.remove(activeList);
              tblNames.add(renameListPage);
              print(
                  "Count: ${tblNames.length} Old: $activeList, New: $renameListPage");
              setState(() {
                activeList = renameListPage;
                listName = activeList;
              });
              _getTasks();
            }
          },
          deleteList: () async {
            if (tblNames.length > 1 && activeList != defaultListName) {
              Navigator.pop(context);
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
    });
    var completedTasks =
        getTasksByStatus("COMPLETED", listName: listName) ?? [];
    print("Completed Tasks: " + completedTasks?.length.toString());
    setState(() {
      completedTaskList?.clear();
      completedTaskList?.addAll(completedTasks);
    });
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
      _getTasks();
    } else {
      print("getTables returned null");
    }
    _getTasks();
  }
}
