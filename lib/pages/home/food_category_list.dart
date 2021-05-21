import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/models/food_category.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:delivery/pages/common/theme.dart';

class FoodCategoryList extends StatefulWidget {
  final List<String> _foodCategory;
  final List<FoodCatagory> _listFoodCategory;
  final int _selectedFoodCategoryId;

  FoodCategoryList(
      this._foodCategory, this._listFoodCategory, this._selectedFoodCategoryId);

  @override
  _FoodCategoryListState createState() => _FoodCategoryListState();
}

class _FoodCategoryListState extends State<FoodCategoryList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("FoodCategory").snapshots(),
      builder: (context, snapshots) {
        return ListView.builder(
          itemCount: snapshots.data.docs.length,
          itemBuilder: (context, index) {
            if (snapshots.hasData != null)
              return Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget._foodCategory.length,
                  itemBuilder: (context, index) {
                    // Color selectedContainer =  _listFoodCategory[_selectedFoodCategoryId].name == _foodCategory[index] ?  grey: primaryColor;
                    Color selectedContainer = grey;
                    Color selectedText = Colors.black;
                    // Color selectedText =  _listFoodCategory[_selectedFoodCategoryId].name == _foodCategory[index] ?  Colors.black: Colors.white;
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
                              width: 5,
                            ),
                            Text(
                              widget._foodCategory[index],
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
                  },
                ),
              );
            else
              return Text("change");
          },
        );
      },
    );
  }
}
