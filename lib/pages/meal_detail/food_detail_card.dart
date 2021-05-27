import 'package:delivery/models/food.dart';
import 'package:delivery/pages/common/image.dart';
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
        child: ImageView(_food.pictureUrl, 150, 150),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          _food.foodName,
          style: DetailBoldText,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          Food.trimText(_food.description, 120),
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  _food.price.toString(),
                  style: DetailBoldText,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rating",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  _food.rating.toString(),
                  style: DetailBoldText,
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
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _food.delivaryTime.toString(),
              style: DetailBoldText,
            )
          ],
        ),
      ],
    );
  }
}
