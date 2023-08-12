import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:greenpath_20/screens/reset-password-screen.dart';
import 'package:greenpath_20/services/auth-service.dart';
import 'package:greenpath_20/services/farmer-service.dart';
import 'package:provider/provider.dart';

class AddCultivationScreen extends StatefulWidget {
  static const routeName = '/add-cultivation';

  const AddCultivationScreen({Key? key}) : super(key: key);

  @override
  State<AddCultivationScreen> createState() => _AddCultivationScreenState();
}

class _AddCultivationScreenState extends State<AddCultivationScreen> {
  final _nameController = TextEditingController();
  late FarmerService farmerService;
  String id = "";

  initialise() {
    farmerService = FarmerService();
    farmerService.initialise();
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  Future<void> update() async {
    await farmerService
        .updateCultivation(id, _nameController.text)
        .then((value) => {});
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    setState(() {
      id = arguments['id'];
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
                    'assets/images/forgotpw.png',
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
                          "Add",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Cultivation",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Add new cultivation name here. It will show in the dashboard after submitting.",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.eco),
                      hintText: 'Enter cultivation name',
                      labelText: 'Cultivation name *',
                    ),
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
                        update();
                      },
                      child: Text('Add',
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
