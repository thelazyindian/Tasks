import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/task.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  late TextEditingController _textEditingController;
  bool viewDetailsField = false;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      child: Wrap(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0)),
            ),
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _textEditingController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Task',
                        ),
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                      ),
                      (viewDetailsField)
                          ? TextField(
                              autofocus: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Add details',
                                hintStyle: TextStyle(fontSize: 14.0),
                              ),
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                            )
                          : Container(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, .0, 16.0, 16.0),
                  child: Row(
                    children: <Widget>[
                      detailsButton(),
                      dateButton(),
                      Spacer(),
                      saveButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dateButton() => Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Theme.of(context).accentColor.withOpacity(0.3),
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.date_range,
              color: Colors.blue,
            ),
          ),
        ),
      );

  Widget detailsButton() => Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Theme.of(context).accentColor.withOpacity(0.3),
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          onTap: () => setState(() => viewDetailsField = !viewDetailsField),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.list_alt_rounded,
              color: Colors.blue,
            ),
          ),
        ),
      );

  Widget saveButton() => TextButton(
        onPressed: () {
          if (_textEditingController.text.isNotEmpty) {
            context.read<HomeBloc>().add(
                  HomeEvent.addTask(
                    Task(
                      id: DateTime.now().toIso8601String(),
                      name: _textEditingController.text,
                    ),
                  ),
                );
            Navigator.pop(context);
          }
        },
        child: Text(
          'Save',
          style: TextStyle(
            fontSize: 15.0,
            color: Theme.of(context).accentColor,
          ),
        ),
      );
}
