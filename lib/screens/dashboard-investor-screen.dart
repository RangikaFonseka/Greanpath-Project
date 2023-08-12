import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:greenpath_20/services/farmer-service.dart';
import 'package:greenpath_20/services/investor-service.dart';
import 'package:greenpath_20/widgets/condition-card-widget.dart';
import 'package:greenpath_20/widgets/navigation-drawer-widget.dart';
import 'package:greenpath_20/widgets/nearby-farmer-card-widget.dart';

import '../widgets/nearby-business-card-widget.dart';

class DashboardInvestorScreen extends StatefulWidget {
  static const routeName = '/dashboard-investor-screen';
  final userEmail;
  //final Image image;
  //final String name;

  const DashboardInvestorScreen({Key? key, this.userEmail}) : super(key: key);

  @override
  State<DashboardInvestorScreen> createState() =>
      _DashboardInvestorScreenState();
}

class _DashboardInvestorScreenState extends State<DashboardInvestorScreen> {
  int _selectedIndex = 0;
  late InvestorService investorService;
  late FarmerService farmerService;
  List farmerData = [];
  String username = "";
  String businessname = "";
  String location = "";
  List cultivations = [];

  initialise() async {
    investorService = InvestorService();
    farmerService = FarmerService();
    investorService.initialise();
    farmerService.initialise();

    await investorService.getDataByEmail(widget.userEmail).then((value) => {
          setState(() {
            username = value['username'];
            cultivations = value['cultivations'];
            businessname = value['businessname'];
            location = value['location'];
          })
        });

    await farmerService.getDataByDistrict(location).then((value) => {
          setState(() {
            farmerData = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: Text(
              username,
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 50,
            height: 50,
            child: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: 30.0),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 13),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          child: BottomNavigationBar(
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.green,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.green), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message, color: Colors.green),
                  label: 'Messages'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map, color: Colors.green),
                  label: 'Location'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.green),
                  label: 'Account'),
            ],
          ),
        ),
      ),
      drawer: NavigationDrawyerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                    width: double.infinity,
                    height: 180,
                    child: Image.asset(
                      'assets/images/shop.png',
                      fit: BoxFit.cover,
                    )),
                Stack(alignment: Alignment.centerLeft, children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      color: Colors.black54,
                    ),
                    width: double.infinity,
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      businessname,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0),
                    ),
                  )
                ]),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25.0, bottom: 10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Interested Cultivations",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: cultivations.length,
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
                                    cultivations[index],
                                    style: TextStyle(color: Colors.green),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25.0, bottom: 10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nearby Farmers",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: farmerData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: NearbyFarmerCardWidget(
                                  farmerfullname: farmerData[index]
                                      ['fullname'],
                                  district: farmerData[index]['district']),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
