import 'package:flutter/material.dart';
import 'theme.dart';

class HeadTitle extends StatelessWidget {
  final String _title;

  HeadTitle(this._title);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 20, bottom: 5),
      child: Text(
        _title,
        style: AppBarTextStyle,
      ),
    );
  }
}
