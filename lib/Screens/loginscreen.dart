import 'package:azulman/Screens/NavBar.dart';
import 'package:azulman/Constants.dart';
import 'package:azulman/Services/json.info.dart';
import 'package:azulman/Services/Networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class loginscreen extends StatefulWidget {


  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {



  late Future<Welcome> welcome;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate() {
    if (formkey.currentState!. validate()) {
      print ('Validated');
    }else{
      print('Not Validated');
    }
  }


  @override
  void initState() {
    welcome = API_Manager().getData();
    super.initState();
  }
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
            title: kTextNagpur,
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
            padding: const EdgeInsets.only(top: 70.0, right: 20.0, left: 30.0, bottom: 20.0),
            child: Column(
              children: [
                const Text("Login",
                  style: TextStyle(fontSize: 30, color: Color(0xff967d51), fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formkey,
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
                        borderSide: BorderSide(color: Color(0xFF1A237E), width: 2.0,
                        ), // color of the border beside email.
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Phone Number cannot be Blank.";
                      }else if(value.length <10){
                        return " Please enter a valid 10 digit Phone Number.";
                      }else{
                        return null;
                      }
                    }
                ),

                const SizedBox(height: 20.0),
                Container(
                  height: 45,
                  width: 300,
                  decoration: const BoxDecoration(
                    color: Color(0xff967d51) ,
                  ),
                  child: TextButton(
                    onPressed: validate,
                    child: const Text("Send OTP",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
      ),
    );

  }
}
