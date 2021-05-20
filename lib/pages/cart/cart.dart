import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/main.dart';
import 'package:delivery/pages/cart/cart_food_card.dart';
import 'package:delivery/pages/common/head_title.dart';
import 'package:delivery/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:delivery/pages/common/theme.dart';
import 'package:line_icons/line_icons.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carts = Cart.fetchFoodCart(1);

    return SafeArea(
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
                  top: 20,
                  bottom: 20,
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
                        "Cart",
                        style: AppBarTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
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
                      Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 270,
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("Cart")
                              .snapshots(),
                          builder: (context, snapshots) {
                            if (snapshots.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snapshots.data.docs.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      CartFoodCard(carts[index]),
                                    ],
                                  );
                                },
                              );
                            } else
                              return Text("Loading");
                          },
                          // child:
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  "270 ETB",
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
                                  "50 ETB",
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
                                  "320 ETB",
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
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _goToFoodDetail(BuildContext context, int foodId) {
    Navigator.pushNamed(context, MealDetailRoute, arguments: {"id": foodId});
  }

  _returnHome(BuildContext context) {
    Navigator.pushNamed(context, HomeRoute);
  }
}
