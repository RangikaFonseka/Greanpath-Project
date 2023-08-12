import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatefulWidget {
  final String routename;
  final Image image;
  final String name;

  const ItemCardWidget(
      {Key? key,
      required this.routename,
      required this.image,
      required this.name})
      : super(key: key);

  @override
  State<ItemCardWidget> createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            elevation: 5,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  width: 140,
                  height: 140,
                  child: widget.image,
                ),
                Stack(alignment: Alignment.center, children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      color: Colors.black54,
                    ),
                    width: 140,
                    height: 40,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  )
                ]),
              ],
            ),
          ),
        )
      ],
    );
  }
}
