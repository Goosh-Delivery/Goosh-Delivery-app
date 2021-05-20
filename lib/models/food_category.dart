import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/models/food.dart';

class FoodCatagory {
  int foodCatagoryId;
  final String name;
  final List<Food> foods;

  FoodCatagory(this.foodCatagoryId, this.name, this.foods);

  static List<FoodCatagory> fetchAll() {
    return [
      FoodCatagory(1, "Food", [
        Food(
            1,
            "Round Cheese Pizza",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ligula dictum, varius ipsum sit amet, sollicitudin diam. ",
            130.0,
            4.7,
            "30 min",
            "assets/images/pizza.jpeg"),
        Food(
            2,
            "Round Cheese Pizza",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ligula dictum, varius ipsum sit amet, sollicitudin diam. ",
            130.0,
            4.7,
            "30 min",
            "assets/images/pizza.jpeg"),
        Food(
            3,
            "Round Cheese Pizza",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ligula dictum, varius ipsum sit amet, sollicitudin diam. ",
            130.0,
            4.7,
            "30 min",
            "assets/images/pizza.jpeg"),
        Food(
            4,
            "Round Cheese Pizza",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ligula dictum, varius ipsum sit amet, sollicitudin diam. ",
            130.0,
            4.7,
            "30 min",
            "assets/images/pizza.jpeg"),
      ]),
      FoodCatagory(2, "Drinks", [
        Food(
            5,
            "Coca Cola",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ligula dictum, varius ipsum sit amet, sollicitudin diam. ",
            130.0,
            4.7,
            "30 min",
            "assets/images/pizza.jpeg"),
        Food(
            6,
            "Coca Cola",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ligula dictum, varius ipsum sit amet, sollicitudin diam. ",
            130.0,
            4.7,
            "30 min",
            "assets/images/pizza.jpeg"),
      ]),
    ];
  }

  static List<String> fetchFoodCatagoryOnly() {
    List<FoodCatagory> allFoodCatagory = FoodCatagory.fetchAll();
    List<String> result = [];

    for (var i = 0; i < allFoodCatagory.length; i++) {
      result.add(allFoodCatagory[i].name);
    }
    return result;
  }

  static List<Food> fetchFoodByCatagory(int foodCatagoryId) {
    List<FoodCatagory> allFoodCatagory = FoodCatagory.fetchAll();
    List<Food> result = [];

    for (var i = 0; i < allFoodCatagory.length; i++) {
      if (allFoodCatagory[i].foodCatagoryId == foodCatagoryId) {
        return allFoodCatagory[i].foods;
      }
    }
    return result;
  }

  static Food fetchFoodById(int foodId){
    List<FoodCatagory> allFoodCatagory = FoodCatagory.fetchAll();
    Food result;
    for (var i = 0; i < allFoodCatagory.length; i++) {
      List<Food> foods = allFoodCatagory[i].foods;
      for(var j = 0; j < foods.length; j++) {
        if (foods[j].foodId == foodId) {
          return foods[j];
        }
      }
    }
    return result;
  }
}
