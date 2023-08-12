import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:greenpath_20/screens/login-selection-screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 250,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(18.0)),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(LoginSelectionScreen.routeName);
              },
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 15,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
