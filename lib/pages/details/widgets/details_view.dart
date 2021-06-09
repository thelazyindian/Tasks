import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/sub_task.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/core/selected_date_view.dart';
import 'package:tasks/pages/details/widgets/subtask_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/utils/methods.dart';

class DetailsView extends StatefulWidget {
  final Tlist activeTaskList;
  final Task task;
  const DetailsView({
    Key? key,
    required this.activeTaskList,
    required this.task,
  }) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  List<SubTask> subtaskFields = [];
  late List<Tlist> taskLists;
  DateTime? dateTime;

  @override
  void initState() {
    taskLists = context.read<HomeBloc>().state.taskLists;
    dateTime = widget.task.dateTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      children: <Widget>[
        _taskListDropdownMenu(),
        _taskName(),
        _taskDetails(),
        _dateTimePicker(),
        _subtasksList(),
      ],
    );
  }

  Widget _taskName() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextFormField(
          initialValue: widget.task.name,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: 20.0),
        ),
      );

  Widget _taskDetails() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Icon(
              CommunityMaterialIcons.text,
              color: Colors.black54,
            ),
            const SizedBox(width: 24.0),
            Expanded(
              child: TextFormField(
                initialValue: widget.task.details,
                decoration: const InputDecoration(
                  hintText: 'Add details',
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _taskListDropdownMenu() => DropdownButtonFormField<String>(
        items: taskLists
            .map((e) => DropdownMenuItem(
                  value: e.id,
                  child: Text(e.name),
                ))
            .toList(),
        value: widget.activeTaskList.id,
        elevation: 4,
        icon: Container(),
        selectedItemBuilder: (_) => taskLists
            .map((e) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(e.name),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                  ],
                ))
            .toList(),
        iconEnabledColor: Theme.of(context).accentColor,
        dropdownColor: Colors.white,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
        onChanged: (x) {},
      );

  Widget _dateTimePicker() => InkWell(
        onTap: dateTime != null
            ? null
            : () => showDateTimePicker(
                  context: context,
                  initialDate: dateTime ?? DateTime.now(),
                  onSelected: (value) => setState(() => dateTime = value),
                ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CommunityMaterialIcons.calendar_check,
                color: Colors.black54,
              ),
              const SizedBox(width: 24.0),
              dateTime != null
                  ? SelectedDateView(
                      dateTime: dateTime!,
                      onSelected: (value) => setState(() => dateTime = value),
                    )
                  : Text(
                      'Add date/time',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
            ],
          ),
        ),
      );

  void _addSubtask() => setState(() {
        subtaskFields.add(SubTask(id: DateTime.now().toIso8601String()));
        debugPrint(subtaskFields.toString());
      });

  Widget _addSubtasksBtn() => Text(
        'Add subtasks',
        style: TextStyle(
          color: Colors.black54,
        ),
      );

  Widget _subtasksList() => InkWell(
        onTap: subtaskFields.isNotEmpty ? null : _addSubtask,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: Icon(
                  Icons.subdirectory_arrow_right,
                  color: Colors.black54,
                ),
              ),
              subtaskFields.isNotEmpty
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: subtaskFields.length + 1,
                          itemBuilder: (_, idx) => idx == subtaskFields.length
                              ? InkWell(
                                  onTap: _addSubtask,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        22.0, 8.0, .0, 8.0),
                                    child: _addSubtasksBtn(),
                                  ),
                                )
                              : SubtaskField(
                                  key: Key(subtaskFields[idx].id),
                                  initialValue: subtaskFields[idx].name,
                                  onTapCheck: (value) {
                                    subtaskFields[idx] = subtaskFields[idx]
                                        .copyWith(completed: value);
                                  },
                                  onTapRemove: () {
                                    setState(() => subtaskFields.removeAt(idx));
                                  },
                                  onChanged: (value) {
                                    subtaskFields[idx] = subtaskFields[idx]
                                        .copyWith(name: value);
                                  },
                                ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 12.0, .0, .0),
                      child: _addSubtasksBtn(),
                    ),
            ],
          ),
        ),
      );
}
