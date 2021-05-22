import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/main.dart';
import 'package:flutter/material.dart';
import 'package:delivery/models/food.dart';
import 'package:delivery/pages/common/theme.dart';

class FoodCard extends StatefulWidget {
  final Food _food;
  final int _index;

  FoodCard(this._food, this._index);

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  String cartText = "Add to Cart";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Stack(
        children: [
          Container(
            width: 220,
            height: 295,
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadowList,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    widget._food.pictureUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                  // Image.asset(
                  //   _food.pictureUrl,
                  //   width: 100,
                  //   height: 100,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget._food.foodName,
                  style: BoldTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  Food.trimText(widget._food.description, 120),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget._food.price.toString(),
                          style: BoldTextStyle,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rating",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget._food.rating.toString(),
                          style: BoldTextStyle,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 32,
            child: TextButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("Cart")
                    .get()
                    .then((value) {});
                if (this.cartText != "added")
                  FirebaseFirestore.instance.collection("Cart").add({
                    "cart_id": 3,
                    "amount": 1,
                    "foodID": widget._food.foodId,
                    "foodName": widget._food.foodName,
                    "foodPictureUrl": widget._food.pictureUrl,
                    "price": widget._food.price
                  }).then((value) {
                    print("added to cart");
                    setState(() {
                      this.cartText = "added";
                    });
                  });
                // _goToFoodDetail(context, widget._food.foodId);
              },
              child: Text(cartText),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: secondaryColor))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(secondaryColor),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 40,
                  ))),
            ),
          ),
        ],
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
