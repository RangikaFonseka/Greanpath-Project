import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:greenpath_20/screens/create-investor-account-screen.dart';
import 'package:greenpath_20/screens/login-investor-screen.dart';
import 'package:greenpath_20/services/auth-service.dart';
import 'package:provider/provider.dart';

class RegisterInvestorTwoScreen extends StatefulWidget {
  static const routeName = '/register-investor-two';

  const RegisterInvestorTwoScreen({Key? key}) : super(key: key);

  @override
  State<RegisterInvestorTwoScreen> createState() =>
      _RegisterInvestorTwoScreenState();
}

class _RegisterInvestorTwoScreenState extends State<RegisterInvestorTwoScreen> {
  Map<String, bool> values = {
    'Paddy Cultivation': false,
    'Cabbage Cultivation': false,
    'Carrot Cultivation': false,
    'Tomatoe Cultivation': false,
    'Corn Cultivation': false,
    'Eggplant Cultivation': false,
    'Cucumber Cultivation': false,
    'Green pepper Cultivation': false,
    'Potatoe Cultivation': false
  };
  String id = "";
  List<String> selectedCultivations = [];

  Future<void> onSubmit() async {
    await Provider.of<AuthService>(context, listen: false).insertCultivationsInvestor(id, selectedCultivations);
    Navigator.of(context).pushNamed(CreateInvestorAccountScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, String>{}) as Map;
    setState(() {
      id = arguments['responsedata'];
    });
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: BackButton(
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.eco),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Select Interested Cultivations. (max 05)',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                ListView(
                  shrinkWrap: true,
                  children: values.keys.map((String key) {
                    return new CheckboxListTile(
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      title: Text(key),
                      value: values[key],
                      onChanged: (bool? value) {
                        setState(() {
                          values[key] = value!;
                        });
                        if (value == true) {
                          selectedCultivations.add(key);
                        }
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 10.0, right: 30.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        text: "By signing up, you’re agree to our ",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms and Conditions ',
                            style: TextStyle(fontSize: 15, color: Colors.green),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(fontSize: 15, color: Colors.green),
                          )
                        ]
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                  child: SizedBox(
                    width: double.infinity,
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
                        onSubmit();
                      },
                      child: Text('Continue',
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Already Greenpath? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(LoginInvestorScreen.routeName);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
