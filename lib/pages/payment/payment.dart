import 'package:delivery/main.dart';
import 'package:delivery/pages/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 15,
                      bottom: 15,
                    ),
                    child: Stack(
                      alignment: FractionalOffset.topLeft,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _returnHome(context);
                          },
                          child: Icon(
                            LineIcons.arrowLeft,
                            size: 40,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Payment",
                            style: TextStyle(
                              fontFamily: FontNameDefault,
                              fontWeight: FontWeight.w500,
                              fontSize: 26,
                              color: textColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xffecebeb),
                        boxShadow: shadowList,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _returnHome(BuildContext context) {
    Navigator.pushNamed(context, HomeRoute);
  }
}
