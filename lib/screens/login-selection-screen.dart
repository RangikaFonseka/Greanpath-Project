import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:greenpath_20/screens/login-farmer-screen.dart';
import 'package:greenpath_20/screens/login-investor-screen.dart';
import 'package:greenpath_20/screens/register-farmer-screen.dart';
import 'package:greenpath_20/screens/register-investor-one-screen.dart';

class LoginSelectionScreen extends StatelessWidget {
  static const routeName = '/login-selection';

  const LoginSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 250,
              height: 250,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 120,
                      child: Image.asset(
                        'assets/images/farmer-login.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Farmer",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(18.0)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(LoginFarmerScreen.routeName);
                        },
                        child: Text('Login',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.green))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(18.0)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(RegisterFarmerScreen.routeName);
                        },
                        child: Text('Register',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                      ),
                    ),
                  ],
                ),
                VerticalDivider(
                  thickness: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 120,
                      child: Image.asset(
                        'assets/images/investor-login.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Investor",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(18.0)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(LoginInvestorScreen.routeName);
                        },
                        child: Text('Login',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.green))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(18.0)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(RegisterInvestorOneScreen.routeName);
                        },
                        child: Text('Register',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Terms & Conditions",
                  style: TextStyle(color: Colors.green),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Privacy Policy",
                  style: TextStyle(color: Colors.green),
                ),
                SizedBox(
                  height: 30,
                ),
              ])
        ],
      ),
    ));
  }
}
