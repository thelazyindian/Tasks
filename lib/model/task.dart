class Task {
  String _task;

  Task(this._task);

  Task.map(dynamic obj) {
    this._task = obj['task'];
  }

  String get task => _task;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['task'] = _task;
    return map;
  }

  Task.fromMap(Map<String, dynamic> map) {
    _task = map["task"];
  }
}
