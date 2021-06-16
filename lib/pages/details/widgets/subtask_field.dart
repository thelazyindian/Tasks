import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SubtaskField extends StatefulWidget {
  final String? initialValue;
  final bool checked, enabled;
  final VoidCallback onTapCheck, onTapRemove;
  final Function(String) onChanged;

  const SubtaskField({
    Key? key,
    this.initialValue,
    required this.checked,
    required this.onTapCheck,
    required this.onTapRemove,
    required this.onChanged,
    this.enabled = true,
  }) : super(key: key);

  @override
  _SubtaskFieldState createState() => _SubtaskFieldState();
}

class _SubtaskFieldState extends State<SubtaskField> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: widget.enabled ? widget.onTapCheck : null,
          child: Icon(
            widget.checked
                ? CommunityMaterialIcons.check
                : CommunityMaterialIcons.radiobox_blank,
            color: widget.checked ? Theme.of(context).accentColor : null,
            size: 18.0,
          ),
        ),
        const SizedBox(width: 4.0),
        Expanded(
          child: TextFormField(
            focusNode: focusNode,
            initialValue: widget.initialValue,
            enabled: widget.enabled,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              hintText: 'Enter title',
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontSize: 13.5,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
        if (widget.enabled)
          GestureDetector(
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
