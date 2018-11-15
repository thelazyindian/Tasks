import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/fancy_fab.dart';

import '../model/task.dart';

class AddTaskWidget extends StatefulWidget {
  @override
  AddTaskWidgetState createState() => AddTaskWidgetState();
}

class AddTaskWidgetState extends State<AddTaskWidget> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerDetails = TextEditingController();
  bool _showDetails = false;

  @override
  void initState() {
    super.initState();
    _showDetails = false;
    _controller.clear();
    _controllerDetails.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0))),
      child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'New task',
              ),
              autofocus: true,
            ),
            _showDetails
                ? TextField(
                    controller: _controllerDetails,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add details',
                    ),
                  )
                : Container(
                    height: 0.0,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // IconButton(
                //   icon: Icon(
                //     Icons.add_circle,
                //     color: Colors.blue,
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       _showDetails = true;
                //     });
                //   },
                // ),
                FancyFab(
                  icon: Icons.add,
                  detailsPressed: () => setState(() => _showDetails = true),
                  datePressed: () {},
                ),
                FlatButton(
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(
                        context,
                        Task(
                          _controller.text.toString(),
                          "PENDING",
                          _controllerDetails.text.toString(),
                        ));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
