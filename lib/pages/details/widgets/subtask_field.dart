import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class SubtaskField extends StatefulWidget {
  final String? initialValue;
  final Function(bool) onTapCheck;
  final VoidCallback onTapRemove;
  final Function(String) onChanged;
  const SubtaskField({
    Key? key,
    this.initialValue,
    required this.onTapCheck,
    required this.onTapRemove,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SubtaskFieldState createState() => _SubtaskFieldState();
}

class _SubtaskFieldState extends State<SubtaskField> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            final checkedState = !checked;
            setState(() {
              checked = checkedState;
            });
            widget.onTapCheck(checkedState);
          },
          child: Icon(
            checked
                ? CommunityMaterialIcons.check
                : CommunityMaterialIcons.radiobox_blank,
            color: checked ? Theme.of(context).accentColor : Colors.black54,
            size: 18.0,
          ),
        ),
        const SizedBox(width: 4.0),
        Expanded(
          child: TextFormField(
            initialValue: widget.initialValue,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              hintText: 'Enter title',
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontSize: 13.5,
            ),
          ),
        ),
        InkWell(
          onTap: widget.onTapRemove,
          child: Icon(
            CommunityMaterialIcons.close,
            size: 18.0,
          ),
        ),
      ],
    );
  }
}
