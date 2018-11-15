import 'dart:async';

import 'package:flutter/material.dart';

import '../data/database_helper.dart';

class TaskDetailsPage extends StatefulWidget {
  final int taskId;
  final String listName;

  TaskDetailsPage(this.listName, this.taskId);

  @override
  State<StatefulWidget> createState() => TaskDetailsPageState();
}

class TaskDetailsPageState extends State<TaskDetailsPage> {
  // Task _task;
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
    DatabaseHelper.get()
        .getTaskById(widget.listName, widget.taskId)
        .then((task) {
      if (task == null) return;
      setState(() {
        // _task = task;
        _taskName = task.task;
        _details = task.details;

        if (_taskName != null) {
          _taskController = TextEditingController(
            text: _taskName,
          );
        }

        if (_details != null) {
          _detailsController = TextEditingController(
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

          textInput = TextField(
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

          textInput = TextField(
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
    DatabaseHelper.get()
        .updateDateByID(widget.taskId, _taskDate, widget.listName);
  }

  @override
  Widget build(BuildContext context) {
    print("Taskname: $_taskName");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            await DatabaseHelper.get().updateDetailsByID(
                widget.taskId, _taskName, _details, widget.listName);
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              DatabaseHelper.get().deleteTask(widget.taskId, widget.listName);
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(
                right: 16.0,
              ),
              child: Icon(Icons.delete),
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'My Tasks',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              _taskName == null ? Container() : textInput,
              ListTile(
                leading: Icon(Icons.note),
                title: TextField(
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
              ListTile(
                leading: Icon(Icons.date_range),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(Duration(
                      days: 30,
                    )),
                    lastDate: DateTime.now().add(
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
                title: Text('Date'),
              ),
              _taskName != null && _textFieldEnable == true
                  ? Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.subdirectory_arrow_right),
                          Container(
                            width: 16.0,
                          ),
                          RaisedButton(
                            highlightElevation: 0.0,
                            elevation: 0.0,
                            splashColor: Colors.blue,
                            color: Colors.white,
                            onPressed: () {},
                            child: Text('Add subtasks'),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
