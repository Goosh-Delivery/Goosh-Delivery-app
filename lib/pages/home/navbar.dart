import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
          Container(
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.cover,
              width: 90,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                LineIcons.search,
                color: Color(0xff282e6a),
                size: 30.0,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                LineIcons.bars,
                color: Color(0xff282e6a),
                size: 30.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
