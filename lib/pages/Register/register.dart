import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: textController,
        obscureText: false,
        decoration: InputDecoration(
            hintText: "Enter your phone number",
            // hintStyle: TextStyle,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0)),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 1),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0))),
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
      ),
    );
  }
}
