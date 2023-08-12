import 'package:flutter/material.dart';
import 'package:greenpath_20/screens/login-selection-screen.dart';

class NavigationDrawyerWidget extends StatelessWidget {
  const NavigationDrawyerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: <Widget>[
              SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 0, 0, 0),
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 250,
                child: ListView(
                  children: <Widget>[
                    buildMenuItem(
                        text: 'Home',
                        icon: Icons.home_filled,
                        tapHandler: () {
                          //Navigator.of(context).pushNamed(HomeScreen.routeName);
                        }),
                    buildMenuItem(
                        text: 'About',
                        icon: Icons.info,
                        tapHandler: () {
                          //Navigator.of(context).pushNamed(AboutScreen.routeName);
                        }),
                    buildMenuItem(
                      text: 'Share',
                      icon: Icons.share,
                      tapHandler: () {
                        //Share.share('Share this app');
                      },
                    ),
                    buildMenuItem(
                        text: 'Logout',
                        icon: Icons.logout,
                        tapHandler: () {
                          Navigator.of(context).pushNamed(LoginSelectionScreen.routeName);
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text,
      required IconData icon,
      VoidCallback? tapHandler}) {
    final color = Colors.green;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(text,
          style: TextStyle(color: color, fontSize: 20)),
      onTap: tapHandler,
    );
  }
}
