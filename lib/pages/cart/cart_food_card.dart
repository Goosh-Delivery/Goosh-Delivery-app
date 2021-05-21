import 'package:delivery/main.dart';
import 'package:delivery/models/cart_item.dart';
import 'package:delivery/pages/cart/NumericStepAmountButton.dart';
import 'package:delivery/pages/common/theme.dart';
import 'package:flutter/material.dart';

class CartFoodCard extends StatefulWidget {
  final CartItem _cart;

  CartFoodCard(this._cart);

  @override
  _CartFoodCardState createState() => _CartFoodCardState();
}

class _CartFoodCardState extends State<CartFoodCard> {
  int cartAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          GestureDetector(
            onTap: () {
              _goToFoodDetail(context, widget._cart.foodId);
            },
            child: Container(
              margin: EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 0),
              padding:
                  EdgeInsets.only(left: 110, top: 30, bottom: 30, right: 50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: shadowList,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget._cart.foodName,
                    style: BoldTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget._cart.price.toString() + " ETB",
                    style: TextStyle(
                      fontFamily: 'Tahoma',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.asset(
                "assets/images/pizza.jpeg",
                width: 105,
                height: 105,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: (() {
              this.cartAmount = widget._cart.amount;
              return NumericStepAmountButton(
                minValue: 0,
                maxValue: 100,
                amount: this.cartAmount,
              );
            })(),
          ),
        ],
      ),
    );
  }

  _goToFoodDetail(BuildContext context, int foodId) {
    Navigator.pushNamed(context, MealDetailRoute, arguments: {"id": foodId});
  }
}
