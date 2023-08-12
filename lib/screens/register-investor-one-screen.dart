import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greenpath_20/models/http_exception.dart';
import 'package:greenpath_20/screens/create-investor-account-screen.dart';
import 'package:greenpath_20/screens/login-farmer-screen.dart';
import 'package:greenpath_20/screens/login-investor-screen.dart';
import 'package:greenpath_20/screens/register-investor-two-screen.dart';
import 'package:greenpath_20/services/auth-service.dart';
import 'package:provider/provider.dart';

class RegisterInvestorOneScreen extends StatefulWidget {
  static const routeName = '/register-investor-one';

  const RegisterInvestorOneScreen({Key? key}) : super(key: key);

  @override
  State<RegisterInvestorOneScreen> createState() =>
      _RegisterInvestorOneScreenState();
}

class _RegisterInvestorOneScreenState extends State<RegisterInvestorOneScreen> {
  String dropdownValue = 'Select gender *';
  String dropdownDistrictValue = 'Select business location *';
  String dropdownCultivationsValue = 'Select cultivation(add more later) *';
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _businessnameController = TextEditingController();
  var _isLoading = false;
  String responsedata = "";
  List<String> districts = [
    'Select business location *',
    'Colombo',
    'Gampaha',
    'Kalutara',
    'Kandy',
    'Matale',
    'Nuwara Eliya',
    'Galle',
    'Matara',
    'Hambantota',
    'Jaffna',
    'Kilinochchi',
    'Mannar',
    'Vavuniya',
    'Mullaitivu',
    'Batticaloa',
    'Ampara',
    'Trincomalee',
    'Kurunegala',
    'Puttalam',
    'Anuradhapura',
    'Polonnaruwa',
    'Badulla',
    'Moneragala',
    'Ratnapura',
    'Kegalle'
  ];
  List<String> cultivations = [
    'Select cultivation(add more later) *',
    'Paddy',
    'Tomatoe',
    'Cabbage',
    'Corn'
  ];

  Future<void> onSubmit() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<AuthService>(context, listen: false)
          .insertRegisterDataInvestor(
              _fullNameController.text,
              _usernameController.text,
              _businessnameController.text,
              _emailController.text,
              dropdownDistrictValue,
              dropdownValue,
              _phoneController.text)
          .then((value) => {
                setState(() {
                  responsedata = value;
                })
              });
      Navigator.of(context).pushNamed(RegisterInvestorTwoScreen.routeName,
          arguments: {'responsedata': responsedata});
    } on HttpException catch (error) {
      print(error);
      var errorMessage = "Registration Failed!";
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (error) {
      print(error);
      var errorMessage = "Error occured. Please try again later.";
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  child: TextFormField(
                    controller: _fullNameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.face),
                      hintText: 'Enter full name',
                      labelText: 'Full Name *',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter prefered username',
                      labelText: 'Username *',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.alternate_email),
                      hintText: 'Enter email address',
                      labelText: 'Email *',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.male, color: Colors.grey),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_downward, color: Colors.grey),
                          elevation: 16,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>["Select gender *", "Male", "Female"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.contact_phone),
                      hintText: 'Enter mobile number',
                      labelText: 'Mobile *',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                  child: TextFormField(
                    controller: _businessnameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.shop),
                      hintText: 'Enter business name',
                      labelText: 'Business Name *',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.map, color: Colors.grey),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownDistrictValue,
                          icon: Icon(Icons.arrow_downward, color: Colors.grey),
                          elevation: 16,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownDistrictValue = newValue!;
                            });
                          },
                          items: districts
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
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
                  height: 20,
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
