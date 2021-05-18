import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final _text;

  Button(this._text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_text),
    );
  }
}
