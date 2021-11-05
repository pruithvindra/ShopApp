import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class CupertionSwitch extends StatefulWidget {
  Function? switchf;

  CupertionSwitch({Key? key, required this.switchf}) : super(key: key);

  @override
  State<CupertionSwitch> createState() => _CupertionSwitchState();
}

class _CupertionSwitchState extends State<CupertionSwitch> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Is User Active',
          style: Style.display1.copyWith(color: Colors.grey),
        ),
        SizedBox(
          width: 10,
        ),
        CupertinoSwitch(
          value: _switchValue,
          onChanged: (value) {
            widget.switchf!(value);
            setState(() {
              _switchValue = value;
            });
          },
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
