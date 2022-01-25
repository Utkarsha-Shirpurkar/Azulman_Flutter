import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../LoginScreen/NavBar.dart';

class preferences extends StatefulWidget {
  @override
  _preferencesState createState() => _preferencesState();
}

class _preferencesState extends State<preferences> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: Container(
            width: 175.0,
            child: Drawer(
              child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                ListTiles(visualDensity: VisualDensity(horizontal: 0, vertical: -4),title: 'Be a Technician', onTap: () {}),
                ListTiles(visualDensity: VisualDensity(horizontal: 0, vertical: -4),title: 'Current Orders', onTap: () {}),
                ListTiles(visualDensity: VisualDensity(horizontal: 0, vertical: -4),title: 'Past Orders', onTap: () {}),
                ListTiles(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: 'Preferences',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => preferences()));
                    }),
                ListTiles(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: 'Terms',
                  onTap: () {},
                ),
                ListTiles(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  onTap: () {},
                  title: 'How It Works',
                ),
                ListTiles(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: 'Privacy',
                  onTap: () {},
                ),
                ListTiles(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: 'AboutAzul',
                  onTap: () {},
                ),
                ListTiles(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: 'Contact Us',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 170.0,
                ),
                Container(
                  height: 45,
                  width: 300,
                  decoration: const BoxDecoration(
                    color: Color(0xff967d51),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'LOGOUT',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kAzulmanLogo,
            ),
            backgroundColor: const Color(0xFF967d51),
            centerTitle: false,
            title: kTextNagpur,
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              color: const Color(0xFF967d51),
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  kBottomTextStyle,
                ],
              ),
            ),
          ),


          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 72,
                padding: const EdgeInsets.only(top: 50, left: 15),
                child: const Text(
                  'Account Settings',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Containerbox(
                title: 'Edit Profile',
                onPressed: () {},
              ),
              Containerbox(
                title: 'Your Address',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
