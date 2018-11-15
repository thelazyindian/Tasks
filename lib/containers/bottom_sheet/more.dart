import 'package:flutter/material.dart';

class MoreWidget extends StatelessWidget {
  final VoidCallback renameList, deleteList, deleteCompletedTasks;
  final bool canDelete;
  MoreWidget(
      {this.renameList,
      this.deleteList,
      this.deleteCompletedTasks,
      this.canDelete});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
        top: 5.0,
        bottom: 5.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0))),
      child: SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              title: const Text(
                'Sort By',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ListTile(
              leading: Container(
                width: 4.0,
              ),
              title: const Text(
                'My Order',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Icon(Icons.check),
            ),
            ListTile(
              leading: Container(
                width: 4.0,
              ),
              title: const Text(
                'Date',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Icon(Icons.check),
            ),
            Divider(
              height: 10.0,
            ),
            ListTile(
              title: const Text(
                'Rename List',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: renameList,
            ),
            ListTile(
              title: Text(
                'Delete List',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              enabled: canDelete ?? true,
              onTap: deleteList,
            ),
            ListTile(
              title: const Text(
                'Delete all completed tasks',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: deleteCompletedTasks,
            ),
          ],
        ),
      ),
    );
  }
}
