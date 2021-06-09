import 'package:flutter/material.dart';
import 'package:tasks/utils/methods.dart';
import 'package:date_time_format/date_time_format.dart';

class SelectedDateView extends StatelessWidget {
  final DateTime dateTime;
  final Function(DateTime?) onSelected;
  const SelectedDateView({
    Key? key,
    required this.dateTime,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => showDateTimePicker(
              context: context,
              initialDate: dateTime,
              onSelected: onSelected,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 6.0, .0, 8.0),
              child: Text(
                dateTime.format('D, M j'),
                style: TextStyle(
                  fontSize: 13.5,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => onSelected(null),
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
  }
}
