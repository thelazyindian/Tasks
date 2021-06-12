import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/application/details/details_bloc.dart';
import 'package:tasks/models/sub_task.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/pages/core/selected_date_view.dart';
import 'package:tasks/pages/details/widgets/subtask_field.dart';
import 'package:tasks/utils/methods.dart';

class DetailsView extends StatefulWidget {
  final Task task;
  const DetailsView({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          children: <Widget>[
            _taskListDropdownMenu(
              state.taskLists,
              state.activeTaskList,
              state.task,
            ),
            _taskName(state.task),
            _taskDetails(state.task),
            _dateTimePicker(
              state.task.dateTime,
              state.task.completed,
            ),
            _subtasksList(
              state.task.subtasks,
              state.task.completed,
            ),
          ],
        );
      },
    );
  }

  Widget _taskName(Task task) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextFormField(
          initialValue: task.name,
          enabled: !task.completed,
          onChanged: (value) => context
              .read<DetailsBloc>()
              .add(DetailsEvent.onNameChanged(value)),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          style: TextStyle(
            fontSize: 20.0,
            decoration: task.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
      );

  Widget _taskDetails(Task task) => Padding(
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
                initialValue: task.details,
                enabled: !task.completed,
                onChanged: (value) => context
                    .read<DetailsBloc>()
                    .add(DetailsEvent.onDetailsChanged(value)),
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

  Widget _taskListDropdownMenu(
    List<Tlist> taskLists,
    Tlist activeTaskList,
    Task task,
  ) =>
      DropdownButtonFormField<String>(
        items: taskLists
            .map((e) => DropdownMenuItem(
                  value: e.id,
                  child: Text(e.name),
                ))
            .toList(),
        value: activeTaskList.id,
        elevation: 4,
        icon: Container(),
        selectedItemBuilder: (_) => taskLists
            .map((e) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(e.name),
                    Icon(
                      Icons.arrow_drop_down,
                      color:
                          task.completed ? Colors.grey.shade500 : Colors.blue,
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
        onChanged: task.completed ? null : (x) {},
      );

  Widget _dateTimePicker(
    DateTime? dateTime,
    bool completed,
  ) =>
      InkWell(
        onTap: dateTime != null || completed
            ? null
            : () => showDateTimePicker(
                  context: context,
                  initialDate: dateTime ?? DateTime.now(),
                  onSelected: (value) => context
                      .read<DetailsBloc>()
                      .add(DetailsEvent.onDateChanged(value)),
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
                      key: Key(widget.task.id),
                      dateTime: dateTime,
                      onSelected: (value) => context
                          .read<DetailsBloc>()
                          .add(DetailsEvent.onDateChanged(value)),
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

  void _addSubtask() =>
      context.read<DetailsBloc>().add(DetailsEvent.onSubtaskAdded());

  Widget _addSubtasksBtn() => Text(
        'Add subtasks',
        style: TextStyle(
          color: Colors.black54,
        ),
      );

  Widget _subtasksList(
    List<SubTask> subtasks,
    bool completed,
  ) =>
      InkWell(
        onTap: subtasks.isNotEmpty || completed ? null : _addSubtask,
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
              subtasks.isNotEmpty
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: subtasks.length + 1,
                          itemBuilder: (_, idx) => idx == subtasks.length
                              ? InkWell(
                                  onTap: _addSubtask,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        22.0, 8.0, .0, 8.0),
                                    child: _addSubtasksBtn(),
                                  ),
                                )
                              : SubtaskField(
                                  key: Key(subtasks[idx].id),
                                  initialValue: subtasks[idx].name,
                                  checked: subtasks[idx].completed,
                                  onTapCheck: () => context
                                      .read<DetailsBloc>()
                                      .add(
                                          DetailsEvent.onSubtaskCompleted(idx)),
                                  onTapRemove: () => context
                                      .read<DetailsBloc>()
                                      .add(DetailsEvent.onSubtaskRemoved(idx)),
                                  onChanged: (value) => context
                                      .read<DetailsBloc>()
                                      .add(DetailsEvent.onSubtaskUpdated(
                                          idx, value)),
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
