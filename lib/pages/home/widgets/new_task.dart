import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/task.dart';
import 'package:date_time_format/date_time_format.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  late TextEditingController _taskEditingController, _detailsEditingController;
  bool viewDetailsField = false;
  DateTime? date;

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
                      if (date != null) _selectedDateView(),
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

  Widget _selectedDateView() => Container(
        margin: EdgeInsets.only(top: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => _showDatePicker(date!),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 6.0, .0, 8.0),
                child: Text(
                  date!.format('D, M j'),
                  style: TextStyle(
                    fontSize: 13.5,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => setState(() => date = null),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                child: Icon(
                  Icons.close,
                  size: 20.0,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ),
      );

  Widget dateButton() => Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Theme.of(context).accentColor.withOpacity(0.3),
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          onTap: () => _showDatePicker(DateTime.now()),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.date_range,
              color: Colors.blue,
            ),
          ),
        ),
      );

  void _showDatePicker(DateTime initialDate) {
    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year + 30),
    ).then((value) => setState(() => date = value));
  }

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
