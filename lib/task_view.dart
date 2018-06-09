import 'package:flutter/material.dart';
import 'task_data.dart';

class _TaskListItem extends StatelessWidget {
  final TaskData _task;

  _TaskListItem(this._task);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            height: 8.0,
          ),
         new Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             new Container(
               width: 30.0,
             ),
             new Icon(
               Icons.radio_button_unchecked,
             ),
             new Container(
               width: 18.0,
             ),
             new Text(_task.task,),
           ],
         ),
          new Container(
            height: 8.0,
          ),
          new Divider(
            height: 8.0,
          ),
        ]
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final List<TaskData> _tasks;

  TaskList(this._tasks);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      children: _buildTaskList(),
    );
  }

  List<_TaskListItem> _buildTaskList() {
    return _tasks.map((task) => new _TaskListItem(task)).toList();
  }
}
