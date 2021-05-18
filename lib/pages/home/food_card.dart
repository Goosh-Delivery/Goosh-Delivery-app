import 'package:delivery/main.dart';
import 'package:flutter/material.dart';
import 'package:delivery/models/food.dart';
import 'package:delivery/pages/common/theme.dart';

class FoodCard extends StatelessWidget {
  final List<Food> _foods;
  final int _index;

  FoodCard(this._foods, this._index);

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
                  child: Image.asset(
                    _foods[_index].pictureUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _foods[_index].foodName,
                  style: BoldTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  Food.trimText(_foods[_index].description, 120),
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
                          _foods[_index].price.toString(),
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
                          _foods[_index].rating.toString(),
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
                _goToFoodDetail(context, _foods[_index].foodId);
              },
              child: Text("Add To Cart"),
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
}
