import 'dart:async';

import 'package:flutter/material.dart';
import '../data/data_handler.dart';
import '../model/task.dart';

// import '../data/database_helper.dart';

class TaskDetailsPage extends StatefulWidget {
  final String listName;
  final Task task;

  TaskDetailsPage(this.listName, this.task);

  @override
  State<StatefulWidget> createState() => TaskDetailsPageState();
}

class TaskDetailsPageState extends State<TaskDetailsPage> {
  Task task;
  // String _taskName;
  TextDecoration _textFieldDecoration;
  Color _textFieldColor;
  bool _textFieldEnable;
  bool _textFieldFocus;
  TextField textInput;
  // String _taskDate;
  // String _details;
  TextEditingController _detailsController, _taskController;

  Future _getTask() async {
    // task = getTask(widget.task.id, listName: widget.listName);
    task = widget.task;
    // DatabaseHelper.get()
    //     .getTaskById(widget.listName, widget.taskId)
    //     .then((task) {
    if (task == null) return;
    setState(() {
      // _task = task;
      // _taskName = task.title;
      // _details = task.subtitle;

      if (task.title != null) {
        _taskController = TextEditingController(
          text: task.title,
        );
      }

      if (task.subtitle != null) {
        _detailsController = TextEditingController(
          text: task.subtitle,
        );
      }
      print(task.status);
      print(task.title);
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
              task.title = value;
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
    // });
  }

  @override
  void initState() {
    _getTask();
    super.initState();
  }

  // void updateDate(DateTime dt) {
  //   print("updateDate: ${dt.toString()}");
  //   _taskDate = dt.toString();
  //   DatabaseHelper.get()
  //       .updateDateByID(widget.taskId, _taskDate, widget.listName);
  // }

  @override
  Widget build(BuildContext context) {
    print("Taskname: " + task.title);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            // await DatabaseHelper.get().updateDetailsByID(
            //     widget.taskId, _taskName, _details, widget.listName);
            updateTask(widget.task.id, task, listName: widget.listName);
            Navigator.pop(context, true);
          },
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              // DatabaseHelper.get().deleteTask(widget.taskId, widget.listName);
              removeTask(task, listName: widget.listName);
              Navigator.pop(context, false);
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
              task.title == null ? Container() : textInput,
              ListTile(
                leading: Icon(Icons.note),
                title: TextField(
                  controller: _detailsController,
                  onChanged: (details) {
                    setState(() {
                      task.subtitle = details;
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
                    initialDate: task?.date ?? DateTime.now(),
                    firstDate: (task?.date ?? DateTime.now()).subtract(Duration(
                      days: 30,
                    )),
                    lastDate:
                        (task?.date ?? DateTime.now()).add(Duration(days: 365)),
                  ).then((value) {
                    if (value == null) return;
                    print("Date: ${value.toIso8601String()}");
                    setState(() {
                      // updateDate(value);
                      task.date = value;
                    });
                  }).catchError((error) {
                    print(error.toString());
                  });
                },
                title: Text('Date'),
              ),
              task.title != null && _textFieldEnable == true
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
