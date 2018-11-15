import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateViewWidget extends StatelessWidget {
  final VoidCallback onClose;
  final DateTime date;

  DateViewWidget({this.date, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: Colors.grey[200],
          borderRadius: new BorderRadius.all(
            const Radius.circular(5.0),
          )),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.event_available,
              color: date.millisecondsSinceEpoch <
                      DateTime.now().millisecondsSinceEpoch
                  ? Colors.red
                  : Colors.blue,
            ),
            Container(width: 5.0),
            Text(DateFormat('MM-dd-yyyy').format(date)),
            onClose == null
                ? Container()
                : IconButton(
                    icon: Icon(Icons.close),
                    onPressed: onClose,
                  )
          ],
        ),
      ),
    );
  }
}
