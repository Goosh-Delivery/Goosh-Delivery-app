import 'package:delivery/main.dart';
import 'package:delivery/pages/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class PaymentMethod {
  String text;
  int index;
  bool selected;

  PaymentMethod({this.text, this.index, this.selected});
}

class _PaymentState extends State<Payment> {
  int _value2 = 0;
  List<PaymentMethod> _group = [
    PaymentMethod(text: "Hello Cash", index: 1, selected: true),
    PaymentMethod(text: "Sahay", index: 2, selected: false),
    PaymentMethod(text: "Cash", index: 3, selected: false),
  ];

  Widget makeRadioTiles() {
    List<Widget> list = [];

    for (int i = 0; i < _group.length; i++) {
      list.add(new RadioListTile(
        value: _group[i].index,
        groupValue: _value2,
        selected: _group[i].selected,
        onChanged: (val) {
          setState(() {
            for (int i = 0; i < _group.length; i++) {
              _group[i].selected = false;
            }
            _value2 = val;
            _group[i].selected = true;
          });
        },
        activeColor: secondaryColor,
        controlAffinity: ListTileControlAffinity.trailing,
        title: new Text(
          ' ${_group[i].text}',
          style: TextStyle(
              color: _group[i].selected ? Colors.black : Colors.grey,
              fontSize: 20,
              fontWeight:
              _group[i].selected ? FontWeight.bold : FontWeight.normal),
        ),
      ));
    }

    Column column = new Column(
      children: list,
    );
    return column;
  }

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
                      left: 25,
                      top: 30,
                      bottom: 23,
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                            child: Text("Please Choose one of the options to pay", style: TextStyle(fontSize: 17, color: Colors.grey[600]),),
                          ),
                          Column(
                            children: [
                              Padding(
                               child: makeRadioTiles(),
                                padding: EdgeInsets.only(left: 20, top: 20),
                              )
                            ],
                          ),
                          SizedBox(height: 50,),
                          TextButton(
                            onPressed: () {
                              _checkOut(context);
                            },
                            child: Container(
                                width: 230,
                                alignment: Alignment.center,
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(color: secondaryColor))),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    secondaryColor),
                                foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                                padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                      vertical: 18,
                                      horizontal: 20,
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
  _checkOut(BuildContext context) {
    Navigator.pushNamed(context, checkOutRoute);
  }
  _returnHome(BuildContext context) {
    Navigator.pushNamed(context, cartRoute);
  }

}
