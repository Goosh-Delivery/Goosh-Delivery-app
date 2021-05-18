import 'package:delivery/models/food.dart';
import 'package:delivery/pages/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FoodDetailCard extends StatelessWidget {
  final Food _food;
  const FoodDetailCard(this._food);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Image.asset(
              _food.pictureUrl,
              width: 140,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          _food.foodName,
          style: BoldTextStyle,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          Food.trimText(_food.description, 120),
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(
          height: 15,
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
                  _food.price.toString(),
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
                  _food.rating.toString(),
                  style: BoldTextStyle,
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery Time",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _food.delivaryTime.toString(),
              style: BoldTextStyle,
            )
          ],
        ),
      ],
    );
  }
}
