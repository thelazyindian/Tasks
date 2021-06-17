import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class DateTimePickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime?) onSelected;
  const DateTimePickerDialog({
    Key? key,
    required this.initialDate,
    required this.onSelected,
  }) : super(key: key);

  @override
  _DateTimePickerDialogState createState() => _DateTimePickerDialogState();
}

enum PickerView { Calendar, Time, Repeat }

class _DateTimePickerDialogState extends State<DateTimePickerDialog> {
  late PickerView _pickerView;

  @override
  void initState() {
    _pickerView = PickerView.Calendar;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _getPickerView(),
          ),
          InkWell(
            onTap: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(CommunityMaterialIcons.clock_outline),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Theme.of(context).dividerColor,
                      ),
                      child: Text(
                        'Set time',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
                const SizedBox(width: 32.0),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPickerView() {
    if (_pickerView == PickerView.Calendar) {
      return CalendarDatePicker(
        initialDate: widget.initialDate,
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime(DateTime.now().year + 30),
        onDateChanged: (x) {},
      );
    } else if (_pickerView == PickerView.Time) {
      return Container();
      // return _TimePickerDialog(
      //   initialTime: initialTime,
      //   initialEntryMode: initialEntryMode,
      //   cancelText: cancelText,
      //   confirmText: confirmText,
      //   helpText: helpText,
      // );
    } else {
      return Container();
    }
  }
}
