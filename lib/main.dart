import 'package:flutter/material.dart';
import 'task_data.dart';
import 'task_view.dart';

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
            height: 350.0,
            color: Colors.transparent,
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Center(
                  child: new Text("Hi modal sheet"),
                )),
          );
        });
  }

  void _modalBottomSheetMore() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 350.0,
            color: Colors.transparent,
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Center(
                  child: new Text("Hi modal sheet"),
                )),
          );
        });
  }

  void _newTaskModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Column(
            //height: 140.0,
            //color: Colors.transparent,
            children: <Widget>[
              new Container(
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
                            onPressed: () {},
                            color: Theme.of(context).accentColor,
                          ),
                          new Container(
                            width: 240.0,
                          ),
                          new FlatButton(
                            onPressed: () {},
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
            ],
          );
        });
  }

  void showSlideupView() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Column(
            children: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.pop(context),
                child:
                new Container(
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
                              onPressed: () {},
                              color: Theme.of(context).accentColor,
                            ),
                            new Container(
                              width: 240.0,
                            ),
                            new FlatButton(
                              onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton.extended(
        elevation: 3.0,
        icon: const Icon(Icons.add),
        label: const Text('Add a new task'),
        onPressed: () {
          showSlideupView();
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
            SliverFillRemaining(
              child: new TaskList(
                  kTask), /*Column(
                children: <Widget>[

                  new ListTile(
                    leading: new Icon(Icons.radio_button_unchecked),
                    title: new Text(
                      'THrow My PC',
                    ),
                  ),
                  new ListTile(
                    leading: new Icon(Icons.radio_button_unchecked),
                    title: new Text(
                      'Buy new PC',
                    ),
                  ),
                  new ListTile(
                    leading: new Icon(Icons.radio_button_unchecked),
                    title: new Text(
                      'Get pissel sl',
                    ),
                  ),
                ],
              ),*/
            )
            /*SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
                (context, int index) { return  Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 25.0, top: 8.0,),
                      child: Row(
                        children: [
                          Checkbox(
                            onChanged: (bool value){
                              _onChecked(value);
                            },
                            value: _isChecked,
                          ),
                          Text(
                        "List Item $index",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                        ],
                      ),
                );
              }, childCount: 20,
            ),
          ),*/
          ],
        ),
      ),
    );
  }
}
