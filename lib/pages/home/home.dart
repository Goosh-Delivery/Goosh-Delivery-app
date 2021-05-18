import 'package:delivery/pages/common/head_title.dart';
import 'package:delivery/pages/home/food_card.dart';
import 'package:delivery/pages/home/nearby_food_card.dart';
import 'package:flutter/material.dart';
import 'package:delivery/models/food_category.dart';
import 'package:delivery/pages/home/food_category_list.dart';
import 'package:flutter/widgets.dart';
import 'navbar.dart';

class Home extends StatelessWidget {
  static int selectedFoodCategoryId = 1;
  @override
  Widget build(BuildContext context) {
    final allFoodCategory = FoodCatagory.fetchAll();
    final foodCategory = FoodCatagory.fetchFoodCatagoryOnly();
    final foods = FoodCatagory.fetchFoodByCatagory(selectedFoodCategoryId);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
        child: Column(
          children: [
            NavBar(),
            //list of food category
            FoodCategoryList(foodCategory, allFoodCategory,selectedFoodCategoryId),
            HeadTitle("Popular Items"),
            //list of food category
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 315,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  return FoodCard(foods, index);
                },
              ),
            ),
            HeadTitle("Near By"),
            NearByFoodCard(foods, 0),
            SizedBox(height: 80,),
          ],
        ),
      ),
    );
  }
}
