import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/main.dart';
import 'package:delivery/models/food.dart';
import 'package:flutter/material.dart';
import 'package:delivery/pages/common/theme.dart';
class NearByFoodCard extends StatelessWidget {
  final List<Food> _foods;
  final int _index;

  NearByFoodCard(this._foods, this._index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Food").snapshots(),
        builder: (BuildContext context, snapshots) {
          if(snapshots.hasData) return Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 15, bottom: 5, right: 30),
                padding: EdgeInsets.only(left: 105, top: 15, bottom: 25, right: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: shadowList,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _foods[_index].foodName,
                      style: BoldTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      Food.trimText(_foods[_index].description, 80),
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
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        SizedBox(width: 20,),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset(
                    _foods[_index].pictureUrl,
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                right: 0,
                child: TextButton(
                  onPressed: () {
                    Map<String, dynamic> data = snapshots.data;
                    print(snapshots.data.docs[_index]["id"]);
                    _goToFoodDetail(context,data[_index]["id"]);
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
                            horizontal: 20,
                          ))),
                ),
              ),
            ],
          );
          else return Text("this is me");
        },
        // child: ,
      ),
    );
  }

  _goToFoodDetail(BuildContext context, int foodId) {
    Navigator.pushNamed(context, MealDetailRoute, arguments: {"id": foodId});
  }

}
