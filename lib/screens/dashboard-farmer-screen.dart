import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:greenpath_20/screens/add-cultivation-screen.dart';
import 'package:greenpath_20/screens/cultivation-screen.dart';
import 'package:greenpath_20/services/auth-service.dart';
import 'package:greenpath_20/services/farmer-service.dart';
import 'package:greenpath_20/services/investor-service.dart';
import 'package:greenpath_20/widgets/item-card-widget.dart';
import 'package:greenpath_20/widgets/navigation-drawer-widget.dart';
import 'package:greenpath_20/widgets/nearby-business-card-widget.dart';
import 'package:greenpath_20/widgets/weather-card-widget.dart';
import 'package:provider/provider.dart';

class DashboardFarmerScreen extends StatefulWidget {
  final userEmail;
  static const routeName = '/dashboard-farmer';

  const DashboardFarmerScreen({Key? key, this.userEmail}) : super(key: key);

  @override
  State<DashboardFarmerScreen> createState() => _DashboardFarmerScreenState();
}

class _DashboardFarmerScreenState extends State<DashboardFarmerScreen> {
  int _selectedIndex = 0;
  late FarmerService farmerService;
  late InvestorService investorService;
  List investorData = [];
  String username = "";
  String id = "";
  String district = "";
  List cultivations = [];

  initialise() async {
    farmerService = FarmerService();
    investorService = InvestorService();
    farmerService.initialise();
    investorService.initialise();

    await farmerService.getDataByEmail(widget.userEmail).then((value) => {
          setState(() {
            username = value['username'];
            cultivations = value['cultivations'];
            id = value['id'];
            district = value['district'];
          })
        });

    await investorService.getDataByLocation(district).then((value) => {
          setState(() {
            investorData = value;
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Dashboard",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
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
                  children: <Widget>[
                    Container(
                      height: 180,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cultivations.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      CultivationScreen.routeName,
                                      arguments: {
                                        'name': cultivations[index]['name']
                                      });
                                },
                                child: ItemCardWidget(
                                    routename: 'cultivation-screen',
                                    image:
                                        cultivations[index]['name'] == 'Paddy'
                                            ? Image.asset(
                                                'assets/images/paddy.png',
                                                fit: BoxFit.cover,
                                              )
                                            : cultivations[index]['name'] ==
                                                    'Cabbage'
                                                ? Image.asset(
                                                    'assets/images/cabbage.png',
                                                    fit: BoxFit.cover,
                                                  )
                                                : cultivations[index]['name'] ==
                                                        'Tomatoe'
                                                    ? Image.asset(
                                                        'assets/images/tomatoe.png',
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.asset(
                                                        'assets/images/carrot.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                    name: cultivations[index]['name']),
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            AddCultivationScreen.routeName,
                            arguments: {'id': id});
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    side: BorderSide(color: Colors.green)),
                                elevation: 5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Add More',
                                      style: TextStyle(color: Colors.green),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Weather Forecast",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: WeatherCardWidget()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nearby Businesses",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: investorData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: NearbyBusinessCardWidget(
                                  investorData: investorData[index],
                                  businessname: investorData[index]
                                      ['businessname'],
                                  location: investorData[index]['location']),
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
