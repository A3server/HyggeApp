import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Handling Btn press if email passed
showAlertDialogPass(BuildContext context) {
  // ignore: non_constant_identifier_names
  Widget CancelButton = TextButton(
    child: Text("CANCEL"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pushReplacementNamed(context, "/signupPhone");
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Are you sure you want to select this email?",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w100, color: Colors.black)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Icon(
            Icons.warning_amber_rounded,
            size: 45,
            color: Colors.purple,
          ),
        ),
        Text(
          "This email will be linked to your Hygge.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w100, color: Colors.black),
        ),
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [okButton, CancelButton],
      ),
    ],
    elevation: 70,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogNOTPASS(BuildContext context) {
  Widget okButton = TextButton(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text("Try Again")],
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Sorry! We couldn't get your email...",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w100, color: Colors.black)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Icon(
            Icons.help_outline_rounded,
            size: 45,
            color: Colors.purple,
          ),
        ),
        Text(
          "The submitted email doesn't belong in our student database",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w100, color: Colors.black),
        ),
      ],
    ),
    actions: <Widget>[
      okButton,
    ],
    elevation: 70,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
