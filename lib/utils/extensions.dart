import 'package:date_time_format/src/date_time_extension_methods.dart';

extension YTT on DateTime {
  String getYTTorFormat(String format, bool viewTime) {
    final sameMY =
        this.month == DateTime.now().month && this.year == DateTime.now().year;
    String result = this.format(format);
    if (sameMY) {
      if (this.day == DateTime.now().day) {
        result = 'Today';
      } else if (this.day == DateTime.now().day - 1) {
        result = 'Yesterday';
      } else if (this.day == DateTime.now().day + 1) {
        result = 'Tomorrow';
      }
    }
    return viewTime ? '$result${this.format(', g:i A')}' : result;
  }
}
