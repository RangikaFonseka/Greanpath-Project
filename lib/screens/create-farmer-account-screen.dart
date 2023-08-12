import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greenpath_20/models/http_exception.dart';
import 'package:greenpath_20/screens/login-farmer-screen.dart';
import 'package:greenpath_20/services/auth-service.dart';
import 'package:provider/provider.dart';

class CreateFarmerAccountScreen extends StatefulWidget {
  static const routeName = '/create-account-farmer';

  const CreateFarmerAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateFarmerAccountScreen> createState() => _CreateFarmerAccountScreenState();
}

class _CreateFarmerAccountScreenState extends State<CreateFarmerAccountScreen> {
   final _passwordController = TextEditingController();
  final _confPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  var _isLoading = false;

  Future<void> onSubmit() async {
    setState(() {
      _isLoading = true;
    });
    if (_passwordController.text != _confPasswordController.text) {
      Fluttertoast.showToast(
        msg: "Password doesn't match",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      try {
        await Provider.of<AuthService>(context, listen: false)
            .signup(_emailController.text, _passwordController.text);
        Navigator.of(context).pushNamed(LoginFarmerScreen.routeName);
      } on HttpException catch (error) {
        var errorMessage = "Authentication Failed!";
        if (error.toString().contains('EMAIL_EXISTS')) {
          errorMessage = 'This email is already in use!';
        } else if (error.toString().contains('INVALID_EMAIL')) {
          errorMessage = 'This email is invalid!';
        } else if (error.toString().contains('WEAK_PASSWORD')) {
          errorMessage = 'Weak password!';
        }
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
        var errorMessage =
            "Could not authenticate you. Please try again later.";
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
                  height: 25,
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
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(
                    'assets/images/farmer.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Create Account",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
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
                    validator: (String? value) {
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Enter password',
                      labelText: 'Password *',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                  child: TextFormField(
                    controller: _confPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Enter password again',
                      labelText: 'Confirm password *',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
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
                      onPressed: () {
                        onSubmit();
                      },
                      child: Text('Create',
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
        ),
      ),
    );
  }
}