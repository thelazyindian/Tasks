import 'dart:ffi';
import 'dart:math';

import 'package:community_material_icon/community_material_icon.dart';
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
  bool _viewDetailsField = false;
  DateTime? _dateTime;
  TimeOfDay? _timeOfDay;

  @override
  void initState() {
    _taskEditingController = TextEditingController();
    _detailsEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
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
                if (_viewDetailsField)
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
                if (_dateTime != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SelectedDateView(
                      dateTime: _dateTime!,
                      timeOfDay: _timeOfDay,
                      onSelected: (date, time) => setState(() {
                        _dateTime = date;
                        _timeOfDay = time;
                      }),
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
            initialDate: _dateTime ?? DateTime.now(),
            timeOfDay: _timeOfDay,
            onSelected: (date, time) => setState(() {
              _dateTime = date;
              _timeOfDay = time;
            }),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              CommunityMaterialIcons.calendar_check,
              color: Theme.of(context).accentColor,
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
          onTap: () => setState(() => _viewDetailsField = !_viewDetailsField),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              CommunityMaterialIcons.text,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      );

  Widget saveButton() => TextButton(
        onPressed: () {
          if (_taskEditingController.text.isNotEmpty) {
            final id = Random.secure().nextInt((2 ^ 31));
            context.read<HomeBloc>().add(
                  HomeEvent.addTask(
                    Task(
                      id: id,
                      name: _taskEditingController.text,
                      order: 0,
                      details: _detailsEditingController.text,
                      dateTime: _dateTime,
                      timeOfDay: _timeOfDay,
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
