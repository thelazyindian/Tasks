import 'package:flutter/material.dart';
import 'package:tasks/pages/core/date_time_picker_dialog.dart';

void showDateTimePicker({
  required BuildContext context,
  required DateTime initialDate,
  required Function(DateTime?) onSelected,
}) {
  showDialog(
    context: context,
    builder: (_) => DateTimePickerDialog(
      initialDate: initialDate,
      onSelected: onSelected,
    ),
  );
}
