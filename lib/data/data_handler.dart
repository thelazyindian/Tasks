import '../model/task.dart';
import '../model/list.dart';
import 'package:flutter/material.dart';

// -- Lists --

List<TaskList> _lists = [];

List<TaskList> getLists() {
  if (_lists == null || _lists.isEmpty) {
    _lists.add(TaskList(name: "My Tasks", tasks: []));
  }
  return _lists;
}

TaskList getList(String name) {
  TaskList _newList;
  for (var _list in _lists) {
    if (name == _list.name) {
      _newList = _list;
    }
  }
  if (_newList == null) {
    addList(name);
  }
  for (var _list in _lists) {
    if (name == _list.name) {
      _newList = _list;
    }
  }
  return _newList;
}

void addList(String name) {
  var _list = TaskList(name: name, tasks: []);
  _lists.add(_list);
}

void updateListName(String oldName, String name) {
  for (var _list in _lists) {
    if (oldName == _list.name) {
      _list.name = name;
    }
  }
}

void removeList(String name) {
  print("Lists: " + _lists?.length.toString() + " List: $name");
  TaskList _toRemove;
  for (var _list in _lists) {
    if (name == _list.name) _toRemove = _list;
  }
  _lists.remove(_toRemove);
}

void updateList(String name, TaskList list) {
  for (var _list in _lists) {
    if (name == _list.name) {
      _list = list;
    }
  }
}

void clearLists() {
  _lists.clear();
}

// -- Tasks --

void addTask(Task task, {@required String listName}) {
  print("Adding Task: " + task?.title + " for: $listName");
  var _tasks = getList(listName)?.tasks ?? [];
  if (task != null) _tasks.add(task);
}

void removeTask(Task task, {@required String listName}) {
  var _tasks = getList(listName)?.tasks ?? [];
  if (task != null) _tasks.remove(task);
}

List<Task> getTasks(String listName) {
  var _tasks = getList(listName)?.tasks ?? [];
  return _tasks;
}

List<Task> getTasksByStatus(String status, {@required String listName}) {
  var _tasks = getList(listName)?.tasks ?? [];
  List<Task> _list = [];
  for (var _task in _tasks) {
    if (_task.status
        .toUpperCase()
        .trim()
        .contains(status.toUpperCase().trim())) {
      _list.add(_task);
    }
  }
  return _list;
}

void clearTasks(String listName) {
  var _tasks = getList(listName)?.tasks ?? [];
  _tasks.clear();
}

Task getTask(int id, {@required String listName}) {
  var _tasks = getList(listName)?.tasks ?? [];
  for (var _task in _tasks) {
    if (id == _task.id) return _task;
  }
  return null;
}

void updateTask(int id, Task task, {@required String listName}) {
  var _tasks = getList(listName)?.tasks ?? [];
  for (var _task in _tasks) {
    if (id == _task.id) {
      _task = task;
    }
  }
}

void clearCompletedTasks(String listName) {
  var _tasks = getList(listName)?.tasks ?? [];
  Task _remove;
  for (var _task in _tasks) {
    if (_task.status == "COMPLETED") {
      _remove = _task;
    }
  }
  _tasks.remove(_remove);
}
