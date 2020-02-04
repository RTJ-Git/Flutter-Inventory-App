import 'package:flutter/material.dart';

class WindowUtils {
  static void moveToLastScreen(BuildContext context, {bool isTrue = false}) {
    Navigator.pop(context, isTrue);
  }

  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void showAlertDialog(
      BuildContext context, String title, String message,
      {onPressed = moveToLastScreen}) {

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text(
          title,
        ),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            message,
          ),
        ),

        actions: <Widget>[
          new FlatButton(
            child: new Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              onPressed(context);
            },
            color: Colors.lightBlueAccent,
          ),
        ],
      );
    },
  );
}

  static String formValidator(String value, String labelText) {
    if (value.isEmpty) {
      return "Please enter $labelText";
    }
  }

  static Widget genTextField(
      {String labelText,
      String hintText,
      TextStyle textStyle,
      TextEditingController controller,
      TextInputType keyboardType = TextInputType.text,
      var onChanged,
      var validator = formValidator,
      bool enabled = true}) {
    final double _minimumPadding = 5.0;

    return Padding(
      padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
      child: TextFormField(
        enabled: enabled,
        keyboardType: keyboardType,
        style: textStyle,
        controller: controller,
        validator: (String value) {
          return validator(value, labelText);
        },
        onChanged: (value) {
          onChanged();
        },
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: textStyle,
            hintText: hintText,
            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ), // Textfield
    );
  } // genTextField function

  static Widget genButton(BuildContext context, String name, var onPressed) {
    return Expanded(
        child: RaisedButton(
            color: Colors.lightBlueAccent,//Theme.of(context).accentColor,
            textColor: Colors.white, // Theme.of(context).primaryColorLight,
            child: Text(name, textScaleFactor: 1.5),
            onPressed: onPressed) // RaisedButton Calculate
        ); //Expanded
  }
}
