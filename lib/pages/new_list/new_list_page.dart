import 'package:flutter/material.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/tlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewListPage extends StatefulWidget {
  final Tlist? taskList;

  const NewListPage({Key? key, this.taskList}) : super(key: key);
  @override
  _NewListPageState createState() => _NewListPageState();
}

class _NewListPageState extends State<NewListPage> {
  late String _scaffoldTitle;
  final _listTitleInputHint = "Enter list title";
  final _appBarDoneAction = "Done";
  String listTitle = '';

  @override
  void initState() {
    _scaffoldTitle =
        widget.taskList != null ? 'Rename List' : 'Create new list';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: <Widget>[
          const Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          TextFormField(
            autofocus: true,
            initialValue: widget.taskList?.name,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              border: InputBorder.none,
              hintText: _listTitleInputHint,
            ),
            onChanged: (value) => setState(() => listTitle = value),
          ),
          const Divider(
            thickness: 2.0,
            height: 1.0,
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).canvasColor,
            ),
          ),
        ],
      ),
    );
  }

  PreferredSize _appBar() => PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: Material(
            color: Theme.of(context).appBarTheme.color,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).appBarTheme.iconTheme!.color,
                  ),
                ),
                Expanded(
                  child: Text(
                    _scaffoldTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: listTitle.isEmpty
                      ? null
                      : () {
                          context.read<HomeBloc>().add(widget.taskList != null
                              ? HomeEvent.renameTaskList(
                                  widget.taskList!.copyWith(name: listTitle))
                              : HomeEvent.createTaskList(listTitle));
                          Navigator.pop(context);
                        },
                  child: Text(
                    _appBarDoneAction,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
