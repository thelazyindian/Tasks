import 'package:flutter/material.dart';

class TaskDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TaskDetailsPageState();
}

class TaskDetailsPageState extends State<TaskDetailsPage> {
  //Task _task;
  //TaskDetailsPageState(this._task)

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        actions: <Widget>[
          new Padding(
            padding: EdgeInsets.only(
              right: 16.0,
            ),
            child: new Icon(Icons.delete),
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
              new TextFormField(
                autofocus: true,
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                enabled: true,
                initialValue: 'ROFLMAO',
              ),
              new ListTile(
                leading: new Icon(Icons.note),
                title: new TextFormField(
                  maxLines: 1,
                  maxLengthEnforced: false,
                  decoration: const InputDecoration(
                      hintText: 'Add details', border: InputBorder.none),
                ),
              ),

              // TODO: Review Theme data items, currently not working as i wanted
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
                  );
                },
                title: new Text('Date'),
              ),

              new Padding(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
