import 'package:azulman/Screens/CustomerScreen/preferences.dart';
import 'package:azulman/Screens/LoginScreen/loginscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azulman/Screens/CustomerScreen/preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Constants.dart';
import '../LoginScreen/NavBar.dart';

class Customerhome extends StatefulWidget {
  @override
  _CustomerhomeState createState() => _CustomerhomeState();
}

class _CustomerhomeState extends State<Customerhome> {
  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double deviceHeight = MediaQuery.of(context).size.height / 18;

    return WillPopScope(
      onWillPop: () async{
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);

        timeBackPressed = DateTime.now();

        if(isExitWarning) {
          final message = 'Press back again to exit';
          Fluttertoast.showToast(
              msg: message,
              backgroundColor: Colors.black45,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
          );
          return false;
        }else{
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        drawer: SafeArea(
          child: Container(
            width: 175.0,
            child: Drawer(
              child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                ListTiles(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: 'Be a Technician',
                  onTap: () {},
                ),
                Container(
                  child: Column(
                    children: [
                      Divider(),
                      ListTiles(
                        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        title: 'Current Orders',
                        onTap: () {},
                      ),
                      ListTiles(
                        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        title: 'Past Orders',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Divider(),
                      ListTiles(
                        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        title: 'Preferences',
                        onTap: () {},
                      ),
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
                    ],
                  ),
                ),
                SizedBox(
                 height: MediaQuery.of(context).devicePixelRatio * 82,
                ),
                Container(
                  height: 45,
                  width: 300,
                  decoration: const BoxDecoration(
                    color: Color(0xff967d51),
                  ),
                  child: TextButton(
                    style: const ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => loginscreen()));
                    },
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
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: const Color(0xFF967d51),
            height: 45.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                kBottomTextStyle,
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 160,
              child: Stack(
                children: [
                  Row(
                    children: [
                      // Icon(Icons.menu,
                      // color: Colors.white,
                      // ),
                      Container(
                        color: const Color(0xFF967d51),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.12,
                        child: const Align(
                          alignment: Alignment(0.9, 0.50),
                          child: Text(
                            'Nagpur',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).devicePixelRatio * 12,
                    left: SizeConfig.screenWidth! / 2.5,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: kAzulmanLogo,
                    ),
                  ),
                ],
              ),
            ),
            Form(
              child: Padding(
                padding: EdgeInsets.only(top: 150.0,left: 10.0, bottom: 20.0),
                child: Column(
                  children: [
                    const Text(
                      "Customer Screen",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff967d51),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}