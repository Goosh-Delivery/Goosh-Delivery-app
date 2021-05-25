import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/models/food_category.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:delivery/pages/common/theme.dart';

class FoodCategoryList extends StatefulWidget {
  List<String> _foodCategory;
  List<FoodCatagory> _listFoodCategory;
  int _selectedFoodCategoryId;

  // FoodCategoryList();

  @override
  _FoodCategoryListState createState() => _FoodCategoryListState();
}

class _FoodCategoryListState extends State<FoodCategoryList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("FoodCategory").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                Color selectedContainer = grey;
                Color selectedText = Colors.black;
                return InkWell(
                  onTap: () {
                    print("Change Food Category");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: selectedContainer,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          LineIcons.utensils,
                          color: selectedText,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          snapshot.data.docs[index]["name"],
                          style: TextStyle(
                            color: selectedText,
                            fontSize: 16,
                            fontFamily: "Tahoma",
                          ),
                        )
                      ],
                    ),
                  ),
                );
                // return Text("category");
              },
            );
          } else {
            return Text("Loading", textAlign: TextAlign.center,);
          }
        });
  }
}
