import 'package:flutter/material.dart';

import 'package:tasks/models/tlist.dart';

class MainMenu extends StatelessWidget {
  final List<Tlist> taskLists;
  final Tlist activeTaskList;
  const MainMenu({
    Key? key,
    required this.taskLists,
    required this.activeTaskList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              itemCount: taskLists.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: (activeTaskList.id == taskLists[index].id)
                            ? Color(0x4D90CAF9)
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                        ),
                      ),
                      child: ListTile(
                        selected: true,
                        title: Text(
                          taskLists[index].name,
                          style: TextStyle(
                            color: (activeTaskList.id == taskLists[index].id)
                                ? Colors.blueAccent
                                : Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    padding: EdgeInsets.only(
                      left: 8.0,
                      top: 8.0,
                      bottom: 8.0,
                    ),
                  ),
                );
              }),
          Divider(
            height: 4.0,
          ),
          ListTile(
            onTap: () async {},
            leading: Icon(
              Icons.add,
            ),
            title: Text(
              "Create list",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Divider(
            height: 4.0,
          ),
          ListTile(
            leading: Icon(
              Icons.feedback,
            ),
            title: Text(
              "Send feedback",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Divider(
            height: 4.0,
          ),
          ListTile(
            title: Text(
              "Open-source licenses",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Divider(
            height: 4.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  width: 25.0,
                  child: Icon(
                    Icons.arrow_drop_down_circle,
                    size: 5.0,
                  ),
                ),
                Text(
                  "Terms of service",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
