import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NearbyFarmerCardWidget extends StatefulWidget {
  final String farmerfullname;
  final String district;
  
  const NearbyFarmerCardWidget({Key? key, required this.farmerfullname, required this.district}) : super(key: key);

  @override
  State<NearbyFarmerCardWidget> createState() =>
      _NearbyFarmerCardWidgetState();
}

class _NearbyFarmerCardWidgetState extends State<NearbyFarmerCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    'assets/images/business.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.farmerfullname,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.map,
                          color: Colors.green,
                        ),
                        Text(
                          widget.district,
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 1,
            ),
          ],
        ),
      ),
    );
  }
}
