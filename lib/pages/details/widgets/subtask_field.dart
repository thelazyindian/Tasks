import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class SubtaskField extends StatelessWidget {
  final String? initialValue;
  final bool checked;
  final VoidCallback onTapCheck, onTapRemove;
  final Function(String) onChanged;
  const SubtaskField({
    Key? key,
    this.initialValue,
    required this.checked,
    required this.onTapCheck,
    required this.onTapRemove,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTapCheck,
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
            initialValue: initialValue,
            onChanged: onChanged,
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
        GestureDetector(
          onTap: onTapRemove,
          child: Icon(
            CommunityMaterialIcons.close,
            size: 18.0,
          ),
        ),
      ],
    );
  }
}