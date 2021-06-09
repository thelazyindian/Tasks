import 'package:flutter/material.dart';

void showDateTimePicker({
  required BuildContext context,
  required DateTime initialDate,
  required Function(DateTime?) onSelected,
}) {
  showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(DateTime.now().year - 30),
    lastDate: DateTime(DateTime.now().year + 30),
  ).then((value) => onSelected(value));
}
