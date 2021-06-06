import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final int taskId;
  final String listName;

  DetailsPage(this.listName, this.taskId);

  @override
  State<StatefulWidget> createState() => new DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  String? _taskName;
  bool _textFieldEnable = true;
  String? _taskDate;
  String? _details;
  TextEditingController _detailsController = TextEditingController();

  void updateDate(DateTime dt) {
    print("updateDate: ${dt.toString()}");
    _taskDate = dt.toString();
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
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          new GestureDetector(
            onTap: () {
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
              _taskName == null ? new Container() : TextField(),
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
