import 'package:flutter/material.dart';
import 'package:tasks/utils/methods.dart';
import 'package:date_time_format/date_time_format.dart';

class SelectedDateView extends StatelessWidget {
  final DateTime dateTime;
  final Function(DateTime?) onSelected;
  final bool enabled;

  const SelectedDateView({
    Key? key,
    required this.dateTime,
    required this.onSelected,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: enabled
                ? () => showDateTimePicker(
                      context: context,
                      initialDate: dateTime,
                      onSelected: onSelected,
                    )
                : null,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 6.0, .0, 8.0),
              child: Text(
                dateTime.format('D, M j'),
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          if (enabled)
            InkWell(
              onTap: () => onSelected(null),
              customBorder: CircleBorder(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                child: Icon(
                  Icons.close,
                  size: 20.0,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
              ),
            )
          else
            const SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
