import 'package:delivery/main.dart';
import 'package:delivery/models/food.dart';
import 'package:delivery/models/food_category.dart';
import 'package:delivery/pages/common/theme.dart';
import 'package:delivery/pages/meal_detail/food_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'NumericStepButton.dart';

class MealDetail extends StatelessWidget {
  final int _id;
  int foodNumber = 1;
  MealDetail(this._id);
  @override
  Widget build(BuildContext context) {
    final Food food = FoodCatagory.fetchFoodById(_id);
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
                    top: 20,
                    bottom: 20,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _returnHome(context);
                    },
                    child: Icon(
                      LineIcons.arrowLeft,
                      size: 40,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffecebeb),
                      boxShadow: shadowList,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FoodDetailCard(food),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: NumericStepButton(
                                minValue: 1,
                                maxValue: 20,
                                onChanged: (value) {
                                  foodNumber += 1;
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffffe3cd),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  LineIcons.trash,
                                  color: secondaryColor,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        )
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

  _returnHome(BuildContext context) {
    Navigator.pushNamed(context, HomeRoute);
  }
}
