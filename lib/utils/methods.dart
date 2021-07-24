import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tasks/pages/core/date_time_picker/date_time_picker_dialog.dart';
import 'package:timezone/timezone.dart' as tz;

void showDateTimePicker({
  required BuildContext context,
  required DateTime initialDate,
  TimeOfDay? timeOfDay,
  required Function(DateTime?, TimeOfDay?) onSelected,
}) {
  showDialog(
    context: context,
    builder: (_) => DateTimePickerDialog(
      initialDate: initialDate,
      timeOfDay: timeOfDay,
    ),
  ).then((value) {
    if (value != null) {
      onSelected(value['date'], value['time']);
    }
  });
}

void scheduleNotification({
  required int id,
  required String title,
  String? body,
  required DateTime dateTime,
}) {
  try {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'task_reminder',
        'Task Reminder',
        'Reminder for timed tasks.',
        icon: 'ic_stat_assignment',
      ),
    );
    flutterLocalNotificationsPlugin
        // .show(
        //   id,
        //   title,
        //   body,
        //   notificationDetails,
        // );
        .zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(dateTime, tz.local),
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  } catch (e) {
    debugPrint('ERROR: $e');
  }
}
