import 'package:flutter/material.dart';
import 'package:tasks/data/database_helper.dart';

class NewListPage extends StatefulWidget {
  @override
  _NewListPageState createState() => new _NewListPageState();
}

class _NewListPageState extends State<NewListPage> {
  final String _scaffoldTitle = "Create new list";
  final String _listTitleInputHint = "Enter list title";
  final String _snackInvalidTitleMsg = "Enter a valid list title first";
  final String _appBarDoneAction = "Done";
  final key = new GlobalKey<ScaffoldState>();
  String newListTitle = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: key,
        backgroundColor: Colors.grey[300],
        appBar: new AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: new IconButton(
              icon: new Icon(
                Icons.close,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: new Text(
            _scaffoldTitle,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 25.0,
            ),
          ),
          actions: <Widget>[
            new FlatButton(
                onPressed: () async {
                  if (newListTitle != null && newListTitle != "") {
                    print('Saving list title');
                    await DatabaseHelper
                        .get()
                        .createTable(newListTitle)
                        .then((_) {
                      Navigator.pop(context);
                    });
                  } else {
                    key.currentState.showSnackBar(
                        new SnackBar(content: new Text(_snackInvalidTitleMsg)));
                  }
                },
                child: new Text(
                  _appBarDoneAction,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ))
          ],
        ),
        body: new Column(
          children: <Widget>[
            new Divider(
              height: 1.0,
            ),
            new Container(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
              color: Colors.white,
              child: new Wrap(
                children: <Widget>[
                  new TextField(
                    onChanged: (listTitle) {
                      newListTitle = listTitle;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: _listTitleInputHint),
                    //autofocus: true,
                    enabled: true,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
