class Task {
  String _task;
  String _status;

  Task(this._task, this._status);

  Task.map(dynamic obj) {
    this._task = obj['task'];
    this._status = obj['status'];
  }

  String get task => _task;
  String get status => _status;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['task'] = _task;
    map['status'] = _status;
    return map;
  }

  Task.fromMap(Map<String, dynamic> map) {
    _task = map["task"];
  }
}
