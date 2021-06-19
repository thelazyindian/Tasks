import 'package:flutter/material.dart';
import 'package:tasks/pages/core/date_time_picker/custom_date_picker.dart';
import 'package:tasks/pages/core/date_time_picker/time_picker.dart' as tp;

class DateTimePickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final TimeOfDay? timeOfDay;
  const DateTimePickerDialog({
    Key? key,
    required this.initialDate,
    this.timeOfDay,
  }) : super(key: key);

  @override
  _DateTimePickerDialogState createState() => _DateTimePickerDialogState();
}

enum PickerView { Calendar, Time, Repeat }

class _DateTimePickerDialogState extends State<DateTimePickerDialog> {
  late PickerView _pickerView;
  late DateTime? _date;
  late TimeOfDay? _timeOfDay;

  @override
  void initState() {
    _date = widget.initialDate;
    _timeOfDay = widget.timeOfDay;
    _pickerView = PickerView.Calendar;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_pickerView == PickerView.Calendar) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: CustomDatePicker(
          initialDate: widget.initialDate,
          onSelected: (date) => setState(() => _date = date),
          timeOfDay: _timeOfDay,
          onPickerChanged: (view) => setState(() => _pickerView = view),
          onDone: () => Navigator.pop(
            context,
            {
              'date': _date,
              'time': _timeOfDay,
            },
          ),
        ),
      );
    } else if (_pickerView == PickerView.Time) {
      return tp.TimePickerDialog(
        initialTime: _timeOfDay,
        clearText: 'CLEAR',
        onCancel: () => setState(() => _pickerView = PickerView.Calendar),
        onSelected: (time) => setState(() {
          _timeOfDay = time;
          _pickerView = PickerView.Calendar;
        }),
      );
    } else {
      return Container();
    }
  }
}
