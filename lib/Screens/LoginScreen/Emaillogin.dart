import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:azulman/Constants.dart';
import 'package:azulman/Screens/LoginScreen/NavBar.dart';
import 'package:flutter/services.dart';
import 'package:azulman/Services/api_const.dart';
import 'package:azulman/Services/Networking.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:azulman/Services/json.info.dart';
import '../../Constants.dart';
import 'OTPEmailVerification.dart';

class Emaillogin extends StatefulWidget {
  Emaillogin(
      {required this.phNumber,
      required this.deviceName,
      required this.identifier});

  final String phNumber;
  final String deviceName;
  final String identifier;

  @override
  _EmailloginState createState() => _EmailloginState();
}

class _EmailloginState extends State<Emaillogin> {
  TextEditingController emailController = TextEditingController();

  late http.Response httpResponse;
  late EmailLoginResponse login;

  @override
  Widget build(BuildContext context) {
    TextEditingController phController =
        TextEditingController(text: '${widget.phNumber}');
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.12,
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
              padding: const EdgeInsets.only(
                  top: 10.0, right: 20.0, left: 30.0, bottom: 20.0),
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
                      controller: phController,
                      // initialValue: '${widget.phNumber}',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        counterText: '',
                        hintText: 'Phone Number',
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
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1A237E),
                            width: 2.0,
                          ),
                        ), // color of the border beside email.
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be Blank.";
                        }
                        if (value.contains('@') && value.endsWith(".com")) {
                          return null;
                        }
                        return ' Please enter a valid Email.';
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 50.0),
                    child: Text(
                      'Please enter your Email to get the OTP.',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                        !emailController.text.contains('@') &&
                                !emailController.text.contains('.com')
                            ? Fluttertoast.showToast(
                                msg: 'Please enter a valid Email.',
                                backgroundColor: Colors.black45,
                                timeInSecForIosWeb: 5,
                              ):
                            emailController.text.isEmpty?
                                Fluttertoast.showToast(
                                  msg: 'Email cannot be blank.',
                                  backgroundColor: Colors.black45,
                                  timeInSecForIosWeb: 5,
                                ):
                             phController.value.text.length < 10?
                                 Fluttertoast.showToast(
                                    msg: 'Please enter a valid 10 digit Phone Number.',
                                    backgroundColor: Colors.black45,
                                    timeInSecForIosWeb: 5,
                                  ):
                             phController.value.text.isEmpty
                                 ? Fluttertoast.showToast(
                               msg: 'Phone Number cannot be blank.',
                               backgroundColor: Colors.black45,
                               timeInSecForIosWeb: 5,
                             ):
                             setState(() async {
                                    var data = jsonEncode(<String, String>{
                                      'Phoneno': '${widget.phNumber}',
                                      'Email': emailController.text,
                                      'DeviceName': '${widget.deviceName}',
                                      'DeviceID': '${widget.identifier}',
                                    });
                                    httpResponse = await API_Manager()
                                        .getData(Strings.sendotpinemail, data);

                                    if (httpResponse.statusCode == 200) {
                                      var jsonString = httpResponse.body;
                                      var jsonMap = jsonDecode(jsonString);
                                      login =
                                          EmailLoginResponse.fromJson(jsonMap);
                                    }
                                    if (login.isValidUser == "true") {
                                      _sendDataToSecondScreen(context);
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: login.message.toString(),
                                        backgroundColor: Colors.black45,
                                        timeInSecForIosWeb: 5,
                                      );
                                    }

                                    print(
                                        "From login: ${login.isValidUser} ${login.message}");
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
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendDataToSecondScreen(BuildContext Context) {
    String emailId = emailController.text;
    String phoneNo = '${widget.phNumber}';
    String DeviceName = '${widget.deviceName}';
    String DeviceId = '${widget.identifier}';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OTPEmailVerification(
                email: emailId,
                phoneNo: phoneNo,
                deviceName: DeviceName,
                identifier: DeviceId)));
  }
}
