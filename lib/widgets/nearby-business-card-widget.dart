import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NearbyBusinessCardWidget extends StatefulWidget {
  final String businessname;
  final String location;
  final investorData;

  const NearbyBusinessCardWidget(
      {Key? key,
      required this.businessname,
      required this.location,
      this.investorData})
      : super(key: key);

  @override
  State<NearbyBusinessCardWidget> createState() =>
      _NearbyBusinessCardWidgetState();
}

class _NearbyBusinessCardWidgetState extends State<NearbyBusinessCardWidget> {
  void showInvestorInfoAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(widget.businessname),
      content: SingleChildScrollView(
        child: SizedBox(
          height: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("-> " + widget.investorData['location'].toString()),
              const SizedBox(
                height: 10,
              ),
              Text("-> " + widget.investorData['mobile'].toString()),
              const SizedBox(
                height: 10,
              ),
              Text("-> Interested Cultivations"),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.investorData['cultivations'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.eco,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.investorData['cultivations'][index],
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
              mainAxisAlignment: MainAxisAlignment.start,
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
                      widget.businessname,
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
                          widget.location,
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: IconButton(
                onPressed: () {
                  showInvestorInfoAlertDialog(context);
                },
                icon: Icon(Icons.remove_red_eye_outlined),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
