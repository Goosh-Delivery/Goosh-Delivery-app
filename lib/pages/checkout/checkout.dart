import 'package:delivery/main.dart';
import 'package:delivery/pages/common/theme.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/checkout-thankyou.png", width: 250, height: 250,)),
              Text("Thank You!", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),),
              SizedBox(height: 10,),
              Text("Your order is on the way", style: TextStyle(fontSize: 16),),
              SizedBox(height: 40,),
              TextButton(
                onPressed: () {
                  _returnHome(context);
                },
                child:Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 16,
                        color: secondaryColor,
                      ),
                    ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xffffe3cd)))),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xffffe3cd)),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                    padding:
                    MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 65,
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _returnHome(BuildContext context) {
    Navigator.pushNamed(context, HomeRoute);
  }
}

