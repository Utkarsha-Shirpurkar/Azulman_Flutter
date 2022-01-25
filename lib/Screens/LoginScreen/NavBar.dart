import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {
  const ListTiles({required this.title, required this.onTap, required VisualDensity visualDensity,});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      title: Text(
          title
      ),
      onTap: onTap,
    );
  }
}
class Containerbox extends StatelessWidget {
  Containerbox({required this.title, required this.onPressed});

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      constraints: const BoxConstraints(maxWidth: 400.0,),
      margin: const EdgeInsets.all(10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          side: const BorderSide(
            color: Colors.black,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}
