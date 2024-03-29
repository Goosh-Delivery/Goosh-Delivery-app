import 'package:flutter/material.dart';

class NumericStepButton extends StatefulWidget {
  final int minValue;
  final int maxValue;

  final ValueChanged<int> onChanged;

  NumericStepButton(
      {Key key, this.minValue = 0, this.maxValue = 10, this.onChanged})
      : super(key: key);

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            padding: EdgeInsets.zero,
            child: IconButton(
              icon: Icon(
                Icons.remove,
                color: Colors.grey[600],
              ),
              // padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
              iconSize: 32.0,
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            color: Colors.white,
            child: Text(
              '$counter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.grey[600],
              ),
              iconSize: 32.0,
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
        ],
      ),
    );
  }
}
