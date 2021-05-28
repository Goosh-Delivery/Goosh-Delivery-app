import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/main.dart';
import 'package:delivery/models/cart_item.dart';
import 'package:delivery/pages/cart/cart_food_card.dart';
import 'package:flutter/material.dart';
import 'package:delivery/pages/common/theme.dart';
import 'package:line_icons/line_icons.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    // final carts = Cart.fetchFoodCart(1);
    // user id
    final uid = "12";
    double price = 0;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            LineIcons.arrowLeft,
                            size: 35,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 5, top: 4),
                        child: Text(
                          "Cart",
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
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      boxShadow: shadowList,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 260,
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("Cart")
                                  .where("cart_id", isEqualTo: 3)
                                  .snapshots(),
                              builder: (context, snapshots) {
                                if (snapshots.hasData) {
                                  return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapshots.data.docs.length,
                                    itemBuilder: (context, index) {
                                      price += (snapshots.data.docs[index]
                                              ["price"]) *
                                          snapshots.data.docs[index]["amount"];
                                      return Column(
                                        children: [
                                          (() {
                                            return CartFoodCard(
                                              CartItem(
                                                snapshots.data.docs[index]
                                                    ["foodID"],
                                                snapshots.data.docs[index]
                                                    ["foodName"],
                                                snapshots.data.docs[index]
                                                    ["price"],
                                                snapshots.data.docs[index]
                                                    ["amount"],
                                                snapshots.data.docs[index]
                                                    ["foodPictureUrl"],
                                              ),
                                            );
                                          })(),
                                        ],
                                      );
                                    },
                                  );
                                } else
                                  return Text("Loading");
                              }
                              // child:
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "90 ETB",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "${189} ETB",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "220 ETB",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            _payment(context);
                          },
                          child: Container(
                              width: 200,
                              alignment: Alignment.center,
                              child: Text(
                                "Check out",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _payment(BuildContext context) {
    Navigator.pushNamed(context, PaymentRoute);
  }

  _returnHome(BuildContext context) {
    Navigator.pushNamed(context, HomeRoute);
  }
}
