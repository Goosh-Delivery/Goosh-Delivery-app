import 'package:delivery/pages/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class NumericStepAmountButton extends StatefulWidget {
  final int minValue;
  final int maxValue;
  int amount;
  final ValueChanged<int> onChanged;

  NumericStepAmountButton(
      {Key key, this.minValue = 0, this.maxValue = 10,  this.amount = 1, this.onChanged})
      : super(key: key);

  @override
  State<NumericStepAmountButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepAmountButton> {


  @override
  Widget build(BuildContext context) {
    int counter = widget.amount != null ? widget.amount: 0;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 25,
            height: 30,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            padding: EdgeInsets.zero,
            child: IconButton(
              padding: EdgeInsets.all(3),
              icon: Icon(
                LineIcons.plus,
                color: Colors.white,
              ),
              // padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
              iconSize: 20.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  if (counter < widget.maxValue) {
                    counter++;
                  }
                  widget.onChanged(counter);
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
            color: secondaryColor,
            child: Text(
              '$counter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: 25,
            height: 30,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
            ),
            child: IconButton(
              padding: EdgeInsets.all(3),
              icon: Icon(
                LineIcons.minus,
                color: Colors.white,
              ),
              iconSize: 20.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  if (counter > widget.minValue) {
                    counter--;
                  }
                  widget.onChanged(counter);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}