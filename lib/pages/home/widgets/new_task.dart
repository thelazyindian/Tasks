import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/pages/core/selected_date_view.dart';
import 'package:tasks/utils/methods.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  late TextEditingController _taskEditingController, _detailsEditingController;
  bool viewDetailsField = false;
  DateTime? dateTime;

  @override
  void initState() {
    _taskEditingController = TextEditingController();
    _detailsEditingController = TextEditingController();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        controller: _taskEditingController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Task',
                        ),
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                      ),
                      if (viewDetailsField)
                        TextField(
                          controller: _detailsEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add details',
                            hintStyle: TextStyle(fontSize: 14.0),
                          ),
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                        ),
                      if (dateTime != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: SelectedDateView(
                            dateTime: dateTime!,
                            onSelected: (value) =>
                                setState(() => dateTime = value),
                          ),
                        ),
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
          onTap: () => showDateTimePicker(
            context: context,
            initialDate: DateTime.now(),
            onSelected: (value) => setState(() => dateTime = value),
          ),
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
          if (_taskEditingController.text.isNotEmpty) {
            context.read<HomeBloc>().add(
                  HomeEvent.addTask(
                    Task(
                      id: DateTime.now().toIso8601String(),
                      name: _taskEditingController.text,
                      details: _detailsEditingController.text,
                      dateTime: dateTime,
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
