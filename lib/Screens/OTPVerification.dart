import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'NavBar.dart';
import 'package:azulman/Constants.dart';
class OTPVerification extends StatefulWidget {

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        top: true,
        child: Scaffold(
          drawer: NavBar(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kAzulmanLogo,
            ),
            backgroundColor : const Color(0xFF967d51),
            centerTitle: false,
            title: kTextNagpur, //from constant file.
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              color: const Color(0xFF967d51),
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget> [
                  kBottomTextStyle,
                ],
              ),
            ),
          ),
          body: Form(child: Padding(
            padding: const EdgeInsets.only(top: 70.0, right: 45.0, left: 50.0, bottom: 20.0),
            child: Column(
                children:  [
                  const Text("OTP Verification",
                    style: TextStyle(fontSize: 30, color: Color(0xff967d51), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Enter the OTP send on",
                    style: TextStyle(fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5,),
                    child: PinFieldAutoFill(
                        codeLength: 6,
                        onCodeChanged: (val) {
                          print(val);
                        }
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't receive OTP?",
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {},
                        child: const Text('Resend OTP',
                          style: TextStyle(color: Colors.black54,
                              fontWeight: FontWeight.bold ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 45,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Color(0xff967d51) ,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Verify & Proceed",
                        style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ]
            ),
          ),
          ),
        ),
      ),
    );
  }
}


