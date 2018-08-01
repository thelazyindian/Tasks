import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasks/data/database_helper.dart';
import 'package:tasks/model/task.dart';

class TaskDetailsPage extends StatefulWidget {
  final int taskId;
  final String listName;

  TaskDetailsPage(this.listName, this.taskId);

  @override
  State<StatefulWidget> createState() => new TaskDetailsPageState();
}

class TaskDetailsPageState extends State<TaskDetailsPage> {
  Task _task;
  String _taskName;
  TextDecoration _textFieldDecoration;
  Color _textFieldColor;
  bool _textFieldEnable;
  bool _textFieldFocus;
  TextField textInput;
  String _taskDate;
  String _details;
  TextEditingController _detailsController, _taskController;

  Future getTask() async {
    DatabaseHelper
        .get()
        .getTaskById(widget.listName, widget.taskId)
        .then((task) {
      if (task == null) return;
      setState(() {
        _task = task;
        _taskName = task.task;
        _details = task.details;

        if (_taskName != null) {
          _taskController = new TextEditingController(
            text: _taskName,
          );
        }

        if (_details != null) {
          _detailsController = new TextEditingController(
            text: _details,
          );
        }
        print(task.status);
        print(_taskName);
        if (task.status == "COMPLETED") {
          _textFieldFocus = false;
          _textFieldDecoration = TextDecoration.lineThrough;
          _textFieldColor = Colors.grey;
          _textFieldEnable = false;

          textInput = new TextField(
            autofocus: _textFieldFocus,
            style: TextStyle(
              decoration: _textFieldDecoration,
              fontSize: 35.0,
              color: _textFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            enabled: _textFieldEnable,
            controller: _taskController,
          );
        } else {
          _textFieldFocus = true;
          _textFieldDecoration = TextDecoration.none;
          _textFieldColor = Colors.black;
          _textFieldEnable = true;

          textInput = new TextField(
            onChanged: (value) {
              setState(() {
                _taskName = value;
              });
            },
            autofocus: _textFieldFocus,
            style: TextStyle(
              decoration: _textFieldDecoration,
              fontSize: 35.0,
              color: _textFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            enabled: _textFieldEnable,
            controller: _taskController,
          );
        }
      });
    });
  }

  @override
  void initState() {
    getTask();
    super.initState();
  }

  void updateDate(DateTime dt) {
    print("updateDate: ${dt.toString()}");
    _taskDate = dt.toString();
    DatabaseHelper
        .get()
        .updateDateByID(widget.taskId, _taskDate, widget.listName);
  }

  @override
  Widget build(BuildContext context) {
    print("Taskname: $_taskName");
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () async {
            await DatabaseHelper.get().updateDetailsByID(
                widget.taskId, _taskName, _details, widget.listName);
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          new GestureDetector(
            onTap: () {
              DatabaseHelper.get().deleteTask(widget.taskId, widget.listName);
              Navigator.pop(context);
            },
            child: new Padding(
              padding: EdgeInsets.only(
                right: 16.0,
              ),
              child: new Icon(Icons.delete),
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: new Container(
        color: Colors.white,
        child: new Padding(
          padding: EdgeInsets.only(
            left: 20.0,
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text(
                    'My Tasks',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  new IconButton(
                    onPressed: () {},
                    icon: new Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              _taskName == null ? new Container() : textInput,
              new ListTile(
                leading: new Icon(Icons.note),
                title: new TextField(
                  controller: _detailsController,
                  onChanged: (details) {
                    setState(() {
                      _details = details;
                    });
                  },
                  maxLines: 1,
                  maxLengthEnforced: false,
                  decoration: const InputDecoration(
                      hintText: 'Add details', border: InputBorder.none),
                ),
              ),
              // TODO: Theme DatePicker dialog properly
              new ListTile(
                leading: new Icon(Icons.date_range),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: new DateTime.now(),
                    firstDate: new DateTime.now().subtract(Duration(
                      days: 30,
                    )),
                    lastDate: new DateTime.now().add(
                      Duration(
                        days: 30,
                      ),
                    ),
                  ).then((value) {
                    if (value == null) return;
                    print("Date: ${value.toIso8601String()}");
                    setState(() {
                      updateDate(value);
                    });
                  }).catchError((error) {
                    print(error.toString());
                  });
                },
                title: new Text('Date'),
              ),
              _taskName != null && _textFieldEnable == true
                  ? new Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                      ),
                      child: new Row(
                        children: <Widget>[
                          new Icon(Icons.subdirectory_arrow_right),
                          new Container(
                            width: 16.0,
                          ),
                          new RaisedButton(
                            highlightElevation: 0.0,
                            elevation: 0.0,
                            splashColor: Colors.blue,
                            color: Colors.white,
                            onPressed: () {},
                            child: new Text('Add subtasks'),
                          ),
                        ],
                      ),
                    )
                  : new Container(),
            ],
          ),
        ),
      ),
    );
  }
}
