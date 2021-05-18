import 'package:delivery/models/cart_item.dart';
import 'package:delivery/models/food.dart';
import 'package:delivery/models/food_category.dart';

class Cart {
  final int foodId;
  final int amount;
  final int userId;

  Cart(this.foodId, this.amount, this.userId);

  static List<Cart> fetchAll() {
    return [
      Cart(1, 2, 1),
      Cart(2, 3, 1),
    ];
  }

  static List<CartItem> fetchFoodCart(int userId) {
    List<Cart> myOrders = Cart.fetchAll();
    List<Cart> result = [];
    List<CartItem> returnResult = [];
    for (var orders in myOrders) {
      if (orders.userId == userId) {
        result.add(orders);
      }
    }

    for (var res in result) {
      Food selectedFood = FoodCatagory.fetchFoodById(res.foodId);
      returnResult.add(CartItem(selectedFood.foodId, selectedFood.foodName,
          selectedFood.price, res.amount, selectedFood.pictureUrl));
    }

    return returnResult;
  }
}
