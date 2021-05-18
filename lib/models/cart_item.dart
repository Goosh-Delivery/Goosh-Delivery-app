import 'package:flutter/material.dart';

class CartItem {
  final int foodId;
  final String foodName;
  final double price;
  final int amount;
  final String foodPictureUrl;

  CartItem(
      this.foodId, this.foodName, this.price, this.amount, this.foodPictureUrl);
}
