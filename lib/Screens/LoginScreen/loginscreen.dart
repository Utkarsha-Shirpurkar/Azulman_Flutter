import 'dart:convert';
import 'package:azulman/Services/api_const.dart';
import 'package:azulman/Screens/LoginScreen/NavBar.dart';
import 'package:azulman/Constants.dart';
import 'package:azulman/Services/json.info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';
import 'package:azulman/Services/Networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'OTPVerification.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginscreen extends StatefulWidget {
  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  TextEditingController phonenoController = TextEditingController();

  // To get device id and device name.
  String? deviceName = '';
  String? identifier = '';

  Future<void> _getDeviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        setState(() {
          deviceName = build.model!;
          identifier = build.androidId!; //UUID for Android
        });
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        setState(() {
          deviceName = data.name;
          identifier = data.identifierForVendor!; //UUID for iOS
        });
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }

  late http.Response httpResponse;
  late LoginResponse login;

  String? get errorText {
    final text = phonenoController.value.text;
    if (text.isEmpty) {
      return 'Phone Number cannot be blank.';
    }
    if (text.length < 10) {
      return 'Please enter a valid 10 digit Phone Number.';
    }
    // return null if the text is valid
    return null;
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  DateTime timeBackPressed = DateTime.now();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async{
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);

        timeBackPressed = DateTime.now();

        if(isExitWarning) {
          final message = 'Press back again to exit';
          Fluttertoast.showToast(msg: message,fontSize: 18);
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: const Align(
                          alignment: Alignment(0.9, 0.17),
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
                    top: MediaQuery.of(context).devicePixelRatio * 12.9,
                    left: SizeConfig.screenWidth! / 2.5,
                    child: Container(
                     height: 80,
                      width: 80,
                      // margin: EdgeInsets.symmetric(vertical: 23),
                      decoration: kAzulmanLogo,
                    ),
                  ),
                ],
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, right: 20.0, left: 30.0, bottom: 20.0),
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff967d51),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: formkey,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Phone Number cannot be blank.";
                          }else if(value.length < 10 ) {
                            return "Please enter a valid 10 digit Phone Number";
                          }else {
                            return null;
                          }
                        },
                          keyboardType: TextInputType.number,
                          controller: phonenoController,
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Phone Number',
                            // errorText: errorText,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                              //enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF1A237E),
                                width: 2.0,
                              ), // color of the border beside email.
                            ),
                          ),
                          ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      height: 45,
                      width: 300,
                      decoration: const BoxDecoration(
                        color: Color(0xff967d51),
                      ),
                      child: TextButton(
                        style: const ButtonStyle(
                          splashFactory: NoSplash
                              .splashFactory, //Used for blue flash light on pressed button.
                        ),

                        onPressed: () async {
                          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                          sharedPreferences.setString('phone', phonenoController.text);
                          _getDeviceDetails();

                          phonenoController.value.text.isEmpty?
                          Fluttertoast.showToast(
                              msg: 'Phone Number cannot be blank.',
                              backgroundColor: Colors.black45,
                              timeInSecForIosWeb: 5
                          ):
                          phonenoController.text.length < 10?
                          Fluttertoast.showToast(
                              msg: 'Please enter a valid 10 digit Phone Number.',
                              backgroundColor: Colors.black45,
                              timeInSecForIosWeb: 5
                          ):

                          setState(() async {
                            var data = jsonEncode(<String, String>{
                              'User': phonenoController.text,
                              'DeviceName': '$deviceName',
                              'DeviceID': '$identifier',
                            });
                            httpResponse = await API_Manager()
                                .getData(Strings.loginWithOtpUrl, data);

                            if (httpResponse.statusCode == 200) {
                              var jsonString = httpResponse.body;
                              var jsonMap = jsonDecode(jsonString);
                              login = LoginResponse.fromJson(jsonMap);
                            }
                            if (login.flag == "true") {
                              _sendDataToSecondScreen(context);
                            } else {
                              Fluttertoast.showToast(
                                msg: login.message.toString(),
                                backgroundColor: Colors.black45,
                                timeInSecForIosWeb: 5,
                              );
                            }
                            print("From login: ${login.flag} ${login.message}");


                          });
                        },
                        child: const Text(
                          "Send OTP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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

  void _sendDataToSecondScreen(BuildContext Context) {
    String phoneNumber = phonenoController.text;
    String DeviceName = '$deviceName';
    String DeviceId = '$identifier';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OTPVerification(phoneno: phoneNumber, deviceName: DeviceName, identifier: DeviceId,)));
  }
}
