import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ConditionCardWidget extends StatefulWidget {
  final IconData icon;
  final String name;
  final String value;

  const ConditionCardWidget({Key? key, required this.icon, required this.name, required this.value})
      : super(key: key);

  @override
  State<ConditionCardWidget> createState() => _ConditionCardWidgetState();
}

class _ConditionCardWidgetState extends State<ConditionCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 110,
          height: 140,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    color: Colors.blue,
                    size: 42,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.value,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ],
              )),
        )
      ],
    );
  }
}
