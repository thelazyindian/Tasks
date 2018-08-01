import 'package:flutter/material.dart';
import 'package:tasks/data/database_helper.dart';

class RenameListPage extends StatefulWidget {
  final String listTitle;
  RenameListPage(this.listTitle);

  @override
  _RenameListPageState createState() => new _RenameListPageState();
}

class _RenameListPageState extends State<RenameListPage> {
  final String _scaffoldTitle = "Rename list";
  final String _listTitleInputHint = "Enter list title";
  final String _snackInvalidTitleMsg = "Enter a valid list title first";
  final String _appBarDoneAction = "Done";
  final key = new GlobalKey<ScaffoldState>();
  String newListTitle = "";
  TextEditingController _oldListTitleController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String oldListTitle = widget.listTitle;
    _oldListTitleController = new TextEditingController(text: oldListTitle);
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
                  if (newListTitle != null &&
                      newListTitle != "" &&
                      oldListTitle != null &&
                      oldListTitle != "") {
                    print('Saving list title');
                    await DatabaseHelper
                        .get()
                        .renameTable(oldListTitle, newListTitle)
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
                    controller: _oldListTitleController,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
