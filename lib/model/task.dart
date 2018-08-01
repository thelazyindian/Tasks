class Task {
  int _id;
  String _task;
  String _status;
  String _date;
  String _details;

  Task(this._task, this._status, this._details);

  Task.map(dynamic obj) {
    this._task = obj['task'];
    this._status = obj['status'];
    this._details = obj['details'];
  }

  int get id => _id;
  String get task => _task;
  String get status => _status;
  String get date => _date;
  String get details => _details;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['task'] = _task;
    map['status'] = _status;
    return map;
  }

  Task.fromMap(Map<String, dynamic> map) {
    _id = map["id"];
    _task = map["task"];
    _status = map["status"];
    _details = map["details"];
  }
}
