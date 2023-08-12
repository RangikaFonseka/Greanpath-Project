import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class EnterVerificationScreen extends StatefulWidget {
  const EnterVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EnterVerificationScreen> createState() => _EnterVerificationScreenState();
}

class _EnterVerificationScreenState extends State<EnterVerificationScreen> {
  final FocusScopeNode _node1 = FocusScopeNode();
  final FocusScopeNode _node2 = FocusScopeNode();
  final FocusScopeNode _node3 = FocusScopeNode();
  final FocusScopeNode _node4 = FocusScopeNode();
  final FocusScopeNode _node5 = FocusScopeNode();
  final FocusScopeNode _node6 = FocusScopeNode();
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _node1.dispose();
    _node2.dispose();
    _node3.dispose();
    _node4.dispose();
    _node5.dispose();
    _node6.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: BackButton(
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                'assets/images/verification.png',
                fit: BoxFit.contain,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Enter verification",
                      style:
                          TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "code",
                      style:
                          TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 10.0, right: 30.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Please enter the 6-digit verification number which we have sent to your email address.",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 65,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        focusNode: _node1,
                        onChanged: (value) {
                          _node1.unfocus();
                          _node2.requestFocus();
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0, bottom: 10.0)
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(color: Colors.black, fontSize: 35.0),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 65,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        focusNode: _node2,
                        onChanged: (_) {
                          _node2.unfocus();
                          _node3.requestFocus();
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0, bottom: 10.0)
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(color: Colors.black, fontSize: 35.0),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 65,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        focusNode: _node3,
                        onChanged: (_) {
                          _node3.unfocus();
                          _node4.requestFocus();
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0, bottom: 10.0)
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(color: Colors.black, fontSize: 35.0),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 65,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        focusNode: _node4,
                        onChanged: (_) {
                          _node4.unfocus();
                          _node5.requestFocus();
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0, bottom: 10.0)
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(color: Colors.black, fontSize: 35.0),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 65,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        focusNode: _node5,
                        onChanged: (_) {
                          _node5.unfocus();
                          _node6.requestFocus();
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0, bottom: 10.0)
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(color: Colors.black, fontSize: 35.0),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 65,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        focusNode: _node6,
                        onChanged: (_) {
                          _node6.unfocus();
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0, bottom: 10.0)
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(color: Colors.black, fontSize: 35.0),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 30.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(18.0)),
                  ),
                  onPressed: () {},
                  child: Text('Verify',
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
