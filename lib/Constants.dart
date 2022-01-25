import 'package:flutter/material.dart';

const kAzulmanLogo = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/test_logo.png',
      ),
    )
);

const kTextNagpur = Padding(
  padding: EdgeInsets.only(left: 220.0),
  child: Text("Nagpur",
    style: TextStyle(fontSize: 15.0),
  ),
);

const kBottomTextStyle = Text("SBE Technologies Pvt Ltd.",
  style: TextStyle(color: Colors.white),
);
