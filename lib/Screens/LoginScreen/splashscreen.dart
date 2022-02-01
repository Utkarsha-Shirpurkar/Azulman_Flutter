import 'dart:async';
import 'package:azulman/Screens/CustomerScreen/Customerhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginscreen.dart';

String? finalPhone;

class splashscreen extends StatefulWidget {

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override

  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
        const Duration(seconds: 3),
            () => Get.offAll(finalPhone == null ? loginscreen() : Customerhome()),

            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //   builder: (BuildContext context)  =>  loginscreen(),
            // ),
            // ),
      );
      print('hello');
    });
    super.initState();

  }

  Future getValidationData () async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedPhone = sharedPreferences.getString('phone');
     setState(() {
       finalPhone = obtainedPhone;
     });
     print(finalPhone);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/azulman_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 250.0,bottom: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/test_logo.png', height: 110.0, width: 110.0),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            color: const Color(0xFF967d51),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text("SBE Technologies Pvt Ltd.",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}