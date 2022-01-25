import 'dart:convert';
import 'package:azulman/Screens/CustomerScreen/Customerhome.dart';
import 'package:azulman/Services/json.info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:azulman/Services/api_const.dart';
import 'package:azulman/Services/Networking.dart';
import 'package:http/http.dart' as http;
import '../../Constants.dart';
import 'NavBar.dart';

class OTPEmailVerification extends StatefulWidget {
  OTPEmailVerification({required this.phoneNo, required this.email, required this.deviceName, required this.identifier});

  final String phoneNo;
  final String email;
  final String deviceName;
  final String identifier;

  @override
  _OTPEmailVerificationState createState() => _OTPEmailVerificationState();
}
class _OTPEmailVerificationState extends State<OTPEmailVerification> {

  TextEditingController otpController = TextEditingController();

  late http.Response httpResponse;
  late VerifyUser login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.12,
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
              padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 20.0),
              child: Column(
                children: [
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff967d51),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    child: Text(
                      "Enter the OTP sent on ${widget.email}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 80.0),
                    child: PinCodeTextField(
                        controller: otpController,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.slide,
                        appContext: context,
                        length: 6,
                        textStyle: TextStyle(
                          color: Color(0xff967d51),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                        onChanged: (String Value) {},
                        pinTheme: PinTheme(
                          borderWidth: 1.5,
                          fieldWidth: 26.0,
                          activeColor: Colors.grey,
                          inactiveColor: Colors.grey,
                          inactiveFillColor: Colors.grey,
                          selectedColor: Colors.grey.shade700,
                          selectedFillColor: Colors.grey.shade700,
                        ),
                        showCursor: false
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive OTP?",
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(width: 10.0),
                      InkWell(
                        onTap: () {
                        },
                        child: const Text(
                          'Resend OTP',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    height: 45,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Color(0xff967d51),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      onPressed: () {
                        otpController.value.text.isEmpty?
                        Fluttertoast.showToast(
                            msg: 'Please enter the OTP.',
                            backgroundColor: Colors.black45,
                            timeInSecForIosWeb: 5
                        ):
                        otpController.text.length < 6?
                        Fluttertoast.showToast(
                            msg: 'Please enter a valid 6 digit OTP.',
                            backgroundColor: Colors.black45,
                            timeInSecForIosWeb: 5
                        ):
                        setState(() async {
                          var data = jsonEncode(<String, String>{
                            'User': '${widget.phoneNo}',
                            'OTP': otpController.text,
                            'DeviceName': '${widget.deviceName}',
                            'DeviceID': '${widget.identifier}',
                          });
                          httpResponse = await API_Manager()
                              .getData(Strings.verifyUser, data);
                          print("VerifyRes: ${httpResponse.body}");
                          if (httpResponse.statusCode == 200) {
                            var jsonString = httpResponse.body;
                            var jsonMap = jsonDecode(jsonString);
                            login = VerifyUser.fromJson(jsonMap);
                          }
                          if (login.isValidUser == "true") {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Customerhome()));
                          } else {
                            Fluttertoast.showToast(
                              msg: 'The entered OTP is Incorrect.',
                              backgroundColor: Colors.black45,
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 5,
                            );
                          }
                          print("From login: ${login.isValidUser}");
                        });
                      },
                      child: const Text(
                        "Verify & Proceed",
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
    );

  }
}
