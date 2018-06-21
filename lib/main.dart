import 'package:flutter/material.dart';
import 'package:tasks/data/database_helper.dart';
import 'package:tasks/model/task.dart';

void main() => runApp(new TasksApp());

class TasksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.transparent,
        fontFamily: 'Raleway',
      ),
      home: new TasksHomePage(),
    );
  }
}

class TasksHomePage extends StatefulWidget {
  @override
  _TasksHomePageState createState() => new _TasksHomePageState();
}

class _TasksHomePageState extends State<TasksHomePage> {
  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 530.0,
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: new Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
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
                ),
                new ListTile(
                  title: new Text(
                    "My Tasks",
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
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    new Container(
                      width: 26.0,
                    ),
                    //new Icon(
                    //Icons.,
                    //),
                    new Text(
                      "Terms of service",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
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
          height: 370.0,
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0))),
          child: new Padding(
            padding: EdgeInsets.all(
              10.0,
            ),
            child: new Column(
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
                ),
                new ListTile(
                  title: const Text(
                    'Delete List',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                new ListTile(
                  title: const Text(
                    'Delete all completed tasks',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void onNewTaskSave() {
    if (_newTask != null) {
      var task = new Task(_newTask);
      var db = new DatabaseHelper();
      db.saveTask(task);
      Navigator.pop(context);
      print("Task saved!");
      print("$_newTask");
      _getTasks();
    } else {
      print("Empty field!");
    }
  }

  String _newTask = "";

  void _newTaskModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new GestureDetector(
                //onTapUp: (){void lol(){};},
                child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0))),
                  child: new Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      top: 20.0,
                      right: 20.0,
                      bottom: 22.0,
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
                          //focusNode: FocusNode().unfocus(),
                          autofocus: true,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: 'New Task',
                          ),
                        ),
                        new Container(
                          height: 20.0,
                        ),
                        new Row(
                          children: <Widget>[
                            new IconButton(
                              padding: const EdgeInsets.all(0.0),
                              icon: new Icon(
                                Icons.add_circle,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Theme.of(context).accentColor,
                            ),
                            new Container(
                              width: 240.0,
                            ),
                            new FlatButton(
                              onPressed: () {
                                onNewTaskSave();
                              },
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.teal,
                                ),
                              ),
                              color: Colors.white,
                              splashColor: Colors.blue,
                              textColor: Theme.of(context).accentColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  final List<Task> taskList = new List();

  void _getTasks() {
    DatabaseHelper.get().getTasks().then((tasks) {
      if (tasks == null) return;
      setState(() {
        taskList.clear();
        taskList.addAll(tasks);
        print(tasks.toString());
      });
    });
  }

  @override
  void initState() {
    _getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  'My Tasks',
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
                List<Column>.generate(
                  taskList.length,
                  (int index) {
                    return new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                          ),
                          child: new ListTile(
                            onTap: () {},
                            leading: new Icon(Icons.radio_button_unchecked),
                            title: new Text(taskList[index].task),
                          ),
                        ),
                        new Divider(
                          height: 24.0,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SliverList(
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new ExpansionTile(
                      title: const Text('Completed'),
                      backgroundColor: Colors.white,
                      children: const <Widget>[
                        const ListTile(title: const Text('One')),
                        const ListTile(title: const Text('Two')),
                        const ListTile(title: const Text('Three')),
                        const ListTile(title: const Text('Four'))
                      ]);
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
