import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasks/data/database_helper.dart';
import 'package:tasks/model/task.dart';
import 'package:tasks/pages/new_list_page.dart';
import 'package:tasks/pages/rename_list_page.dart';
import 'package:tasks/pages/task_details.dart';

class TasksHomePage extends StatefulWidget {
  @override
  _TasksHomePageState createState() => new _TasksHomePageState();
}

enum DetailsWidgetStatus { OPEN, CLOSE }

int taskDetailId;
String _newTask = "";
String _taskDetails = "";
String _newTaskStatus = "PENDING";
final List<Task> pendingTaskList = new List();
final List<Task> completedTaskList = new List();
AnimationController detailsTapAnimationController;
final _duration = new Duration(milliseconds: 300);
DetailsWidgetStatus _detailsWidgetStatus = DetailsWidgetStatus.CLOSE;
Future _bottomSheet;
List<String> tblNames = new List();
String listName = "";
String activeList = "";
String defaultListName = "";
StatefulBuilder _builder;
StateSetter setSheetState;
bool details = false;

class _TasksHomePageState extends State<TasksHomePage>
    with TickerProviderStateMixin {
  final GlobalKey scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    detailsTapAnimationController =
        new AnimationController(duration: _duration, vsync: this);
    detailsTapAnimationController.addListener(() {
      setSheetState(() {
        print("Animation: ${detailsTapAnimationController.value.toDouble()}");
        _bottomSheet;
      });
    });
    _getTables();
  }

  dispose() {
    super.dispose();
    detailsTapAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _builder = new StatefulBuilder(
      builder: (BuildContext context, kek) {
        print(kek);
        return new Text('');
      },
    );
    return new Scaffold(
      key: scaffoldKey,
      floatingActionButton: new FloatingActionButton.extended(
        elevation: 3.0,
        icon: const Icon(Icons.add),
        label: const Text('Add a new task'),
        onPressed: () {
          _newTaskModalBottomSheet();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new BottomAppBar(
        elevation: 3.0,
        hasNotch: false,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _modalBottomSheetMenu();
              },
            ),
            new IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                _modalBottomSheetMore();
              },
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
              //centerTitle: true,
              //title: Text ('My Tasks',
              //style: TextStyle(color: Colors.black,),),
              elevation: 0.0,
              flexibleSpace: new FlexibleSpaceBar(
                title: (listName != "" && listName != null)
                    ? new Text(
                        listName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : new Text(""),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List<Dismissible>.generate(
                  pendingTaskList.length,
                  (int index) {
                    final item = pendingTaskList[index].task;
                    return new Dismissible(
                      direction: DismissDirection.startToEnd,
                      key: Key(item),
                      onDismissed: (direction) {
                        print(index);
                        completedTaskList.add(pendingTaskList[index]);
                        pendingTaskList.removeAt(index);
                        /*showSnackBar(
                          new SnackBar(
                            content:
                                Text("${pendingTaskList.length} completed!"),
                          ),
                        );*/
                        updateTaskStatus(item);
                        _getTasks();
                      },
                      background: Container(
                        color: Colors.blue,
                      ),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: new ListTile(
                              onTap: () async {
                                taskDetailId = pendingTaskList[index].id;
                                var route = new MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return new TaskDetailsPage(
                                      listName, taskDetailId);
                                });
                                var detailsPage =
                                    await Navigator.of(context).push(route);
                                if (detailsPage == null) {
                                  _getTasks();
                                }
                              },
                              leading: new Icon(Icons.radio_button_unchecked),
                              title: (pendingTaskList[index].task != null)
                                  ? new Text(pendingTaskList[index].task)
                                  : new Text(""),
                              subtitle: (pendingTaskList[index].details != null)
                                  ? new Text(pendingTaskList[index].details)
                                  : new Text(""),
                            ),
                          ),
                          new Divider(
                            height: 1.0,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            completedList(),
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

  Widget dateButton() {
    var scorePosition = detailsTapAnimationController.value * 100;
    var scoreOpacity = detailsTapAnimationController.value;
    return new Positioned(
      child: new Opacity(
        opacity: scoreOpacity,
        child: new Container(
          height: 32.0,
          width: 32.0,
          decoration: new ShapeDecoration(
            shape: new RoundedRectangleBorder(side: BorderSide.none),
          ),
          child: new Center(
            child: new Icon(
              Icons.date_range,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      left: scorePosition,
    );
  }

  Widget detailsButton() {
    var scorePosition = detailsTapAnimationController.value * 50;
    var scoreOpacity = detailsTapAnimationController.value;
    return new Positioned(
      child: new GestureDetector(
        onTapUp: (TapUpDetails tapUp) {
          print('Tapup');
          if (details == false) {
            setSheetState(() {
              details = true;
            });
          } else {
            setSheetState(() {
              details = false;
            });
          }
        },
        child: new Opacity(
          opacity: scoreOpacity,
          child: new Container(
            height: 32.0,
            width: 32.0,
            decoration: new ShapeDecoration(
              shape: new RoundedRectangleBorder(side: BorderSide.none),
            ),
            child: new Center(
              child: new Icon(
                Icons.format_list_numbered,
                color: (details == false) ? Colors.blue : Colors.grey[400],
              ),
            ),
          ),
        ),
      ),
      left: scorePosition,
    );
  }

  Widget kek() {
    var rotation = detailsTapAnimationController.value == 0.0
        ? detailsTapAnimationController.value
        : detailsTapAnimationController.value + 25;
    var mColor = detailsTapAnimationController.value == 0.0
        ? Colors.blue
        : Colors.blueGrey;
    return new GestureDetector(
      onTapUp: onTapUp,
      child: new Transform.rotate(
        angle: rotation,
        child: new Container(
          height: 32.0,
          width: 32.0,
          padding: new EdgeInsets.all(2.0),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.transparent,
          ),
          child: new Center(
            child: new Icon(
              Icons.add_circle,
              color: mColor,
              size: 26.0,
            ),
          ),
        ),
      ),
    );
  }

  BuildContext bottomSheetContext;

  // TODO: Original one is this
  /*void _newTaskModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext contextt) {
          return new StatefulBuilder(
              builder: (BuildContext ctxt, StateSetter stateSetter) {
            setSheetState = stateSetter;
            return new AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: new GestureDetector(
                onTapUp: (TapUpDetails tap) {
                  print('Tapped');
                },
                child: new Container(
                  alignment: Alignment.bottomCenter,
                  child: Wrap(
                    children: <Widget>[
                      new Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0))),
                        child: new Wrap(
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.only(
                                left: 20.0,
                                top: 15.0,
                                right: 20.0,
                                bottom: 15.0,
                              ),
                              child: new Column(
                                children: <Widget>[
                                  new TextField(
                                    onChanged: (newTask) {
                                      _newTask = newTask;
                                    },
                                    onSubmitted: (newTask) {
                                      onNewTaskSave();
                                    },
                                    autofocus: true,
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'New Task',
                                    ),
                                    autocorrect: false,
                                    keyboardType: TextInputType.text,
                                  ),
                                  (details == true)
                                      ? new TextField(
                                          onChanged: (taskDetails) {
                                            _taskDetails = taskDetails;
                                          },
                                          onSubmitted: (taskDetails) {
                                            onNewTaskSave();
                                          },
                                          autofocus: true,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Add details',
                                            hintStyle: TextStyle(
                                              fontSize: 8.0,
                                            ),
                                          ),
                                          autocorrect: false,
                                          keyboardType: TextInputType.text,
                                        )
                                      : new Container(),
                                  new Container(
                                    height: 20.0,
                                  ),
                                  new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Stack(
                                        //alignment: AlignmentDirectional.center,
                                        //overflow: Overflow.visible,
                                        children: <Widget>[
                                          detailsButton(),
                                          dateButton(),
                                          kek(),
                                        ],
                                      ),
                                      new FlatButton(
                                        onPressed: () {
                                          onNewTaskSave();
                                        },
                                        child: const Text(
                                          'Save',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        color: Colors.white,
                                        splashColor: Colors.blue,
                                        textColor:
                                            Theme.of(context).accentColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }*/

  //TODO: This one is for debug
  void _newTaskModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext contextt) {
          // return new StatefulBuilder(
          //   builder: (BuildContext ctxt, StateSetter stateSetter) {
          // setSheetState = stateSetter;
          return new Column(
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0),
                      ),
                    ),
                    child: Wrap(
                      children: <Widget>[
                        new TextField(
                          onChanged: (newTask) {
                            _newTask = newTask;
                          },
                          onSubmitted: (newTask) {
                            onNewTaskSave();
                          },
                          autofocus: true,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: 'New Task',
                          ),
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                        ),
                        (details == true)
                            ? new TextField(
                                onChanged: (taskDetails) {
                                  _taskDetails = taskDetails;
                                },
                                onSubmitted: (taskDetails) {
                                  onNewTaskSave();
                                },
                                autofocus: true,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Add details',
                                  hintStyle: TextStyle(
                                    fontSize: 8.0,
                                  ),
                                ),
                                autocorrect: false,
                                keyboardType: TextInputType.text,
                              )
                            : new Container(),
                      ],
                    ),
                  ),
                ],
              ),
              new AnimatedContainer(
                height: MediaQuery.of(context).size.height * 0.4,
                duration: new Duration(
                  milliseconds: 300,
                ),
              ),
            ],
          );
          //});
        });
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            //height: 530.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
              ),
            ),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                /*UserAccountsDrawerHeader(
                  currentAccountPicture: new DecoratedBox(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/user/satya_profile.png"),
                      ),
                    ),
                  ),
                  margin: EdgeInsets.all(0.0),
                  accountEmail: new Text(
                    "satyabrat.me@gmail.com",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  accountName: new Text(
                    "Satyabrat Sahoo",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                new Divider(
                  height: 4.0,
                  indent: 2.0,
                ),*/
                new ListView.builder(
                    shrinkWrap: true,
                    itemCount: tblNames.length,
                    itemBuilder: (context, index) {
                      return new GestureDetector(
                        onTap: () {
                          listName = tblNames[index];
                          activeList = listName;
                          _getTasks();
                          Navigator.pop(context);
                        },
                        child: Padding(
                          child: new DecoratedBox(
                            decoration: new BoxDecoration(
                              color: (activeList == tblNames[index])
                                  ? Color(0x4D90CAF9)
                                  : Colors.white,
                              borderRadius: new BorderRadius.only(
                                topLeft: new Radius.circular(30.0),
                                bottomLeft: new Radius.circular(30.0),
                              ),
                            ),
                            child: new ListTile(
                              selected: true,
                              title: new Text(
                                tblNames[index],
                                style: TextStyle(
                                  color: (activeList == tblNames[index])
                                      ? Colors.blueAccent
                                      : Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(
                            left: 8.0,
                            top: 8.0,
                            bottom: 8.0,
                          ),
                        ),
                      );
                    }),
                new Divider(
                  height: 4.0,
                ),
                new ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    var newListPage = await Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new NewListPage();
                    }));
                    if (newListPage == null) {
                      _getTables();
                    }
                  },
                  leading: new Icon(
                    Icons.add,
                  ),
                  title: new Text(
                    "Create new list",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                new Divider(
                  height: 4.0,
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.feedback,
                  ),
                  title: new Text(
                    "Send feedback",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                new Divider(
                  height: 4.0,
                ),
                new ListTile(
                  title: new Text(
                    "Open-source licenses",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                new Divider(
                  height: 4.0,
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Privacy Policy",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      new Container(
                        width: 25.0,
                        child: new Icon(
                          Icons.arrow_drop_down_circle,
                          size: 5.0,
                        ),
                      ),
                      //new Icon(
                      //Icons.,
                      //),
                      new Text(
                        "Terms of service",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _modalBottomSheetMore() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return new Container(
          padding: EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            top: 5.0,
            bottom: 5.0,
          ),
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0))),
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                title: const Text(
                  'Sort By',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              new ListTile(
                leading: new Container(
                  width: 4.0,
                ),
                title: const Text(
                  'My Order',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                trailing: new Icon(Icons.check),
              ),
              new ListTile(
                leading: new Container(
                  width: 4.0,
                ),
                title: const Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                trailing: new Icon(Icons.check),
              ),
              new Divider(
                height: 10.0,
              ),
              new ListTile(
                title: const Text(
                  'Rename List',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  var renameListPage = await Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new RenameListPage(activeList);
                  }));
                  if (renameListPage == null) {
                    _getTables();
                  }
                },
              ),
              new ListTile(
                title: new Text(
                  'Delete List',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color:
                        (tblNames.length > 1 && activeList != defaultListName)
                            ? Colors.black
                            : Colors.grey,
                  ),
                ),
                enabled: true,
                onTap: () async {
                  if (tblNames.length > 1 && activeList != defaultListName) {
                    Navigator.pop(context);
                    await DatabaseHelper.get().deleteTable(activeList);
                    activeList = defaultListName;
                    listName = activeList;
                    _getTables();
                  }
                },
              ),
              new ListTile(
                title: const Text(
                  'Delete all completed tasks',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () async {
                  await DatabaseHelper.get().deleteCompletedTask(activeList);
                  _getTasks();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void onNewTaskSave() {
    if (_newTask != null) {
      var task = new Task(_newTask, _newTaskStatus, _taskDetails);
      var db = new DatabaseHelper();
      db.saveTask(task, activeList);
      Navigator.pop(context);
      print("Task saved!");
      print("$_newTask");
      _getTasks();
    } else {
      print("Empty field!");
    }
  }

  void updateTaskStatus(String task) {
    var db = new DatabaseHelper();
    db.updateTask(task, activeList);
    print('Update Task');
  }

  void _getTasks() {
    print("Running _getTasks()");
    if (listName != null && listName != "") {
      var dbClient = new DatabaseHelper();
      dbClient.getTasksByStatus(listName, "PENDING").then((tasks) {
        if (tasks == null) return;
        setState(() {
          pendingTaskList.clear();
          pendingTaskList.addAll(tasks);
          //print(tasks.toString());
        });
      });

      dbClient.getTasksByStatus(listName, "COMPLETED").then((tasks) {
        if (tasks == null) return;
        setState(() {
          completedTaskList.clear();
          completedTaskList.addAll(tasks);
          //print(tasks.toString());
        });
      });
    } else {
      print("var listName is null");
    }
  }

  void _getTables() {
    DatabaseHelper.get().getTables().then((tableNames) {
      if (tableNames != null) {
        tblNames.clear();
        for (String item in tableNames) {
          setState(() {
            print(item);
            tblNames.add(item);
          });
        }
        activeList = tblNames[0];
        listName = tblNames[0];
        defaultListName = tblNames[0];
        _getTasks();
      } else
        print("getTables returned null");
    });
  }

  Widget completedList() {
    if (completedTaskList.isNotEmpty) {
      return new SliverToBoxAdapter(
        child: new ExpansionTile(
          title: new Text(
            'Completed (${completedTaskList.length})',
          ),
          backgroundColor: Colors.white,
          children: <Widget>[
            new Container(
              height: 68.0 * completedTaskList.length,
              child: new ListView.builder(
                itemCount: completedTaskList.length,
                itemBuilder: (context, index) {
                  return new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: new ListTile(
                          onTap: () async {
                            taskDetailId = completedTaskList[index].id;
                            var route = new MaterialPageRoute(
                                builder: (BuildContext context) {
                              return new TaskDetailsPage(
                                  listName, taskDetailId);
                            });
                            var detailsPage =
                                await Navigator.of(context).push(route);
                            if (detailsPage == null) {
                              _getTasks();
                            }
                          },
                          leading: new Icon(
                            Icons.check,
                            color: Colors.blue,
                          ),
                          title: new Text(
                            completedTaskList[index].task,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ),
                      new Divider(
                        height: 1.0,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return new SliverFillRemaining();
    }
  }
}
