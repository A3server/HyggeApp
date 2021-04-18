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
    title: Text("Are you sure you want to select this phone?",
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
          "This phone will be linked to your Hygge.",
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
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogPassName(BuildContext context) {
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
      Navigator.pushReplacementNamed(context, "/signupEmail");
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Are you sure you want to select this name?",
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
          "This name will be linked to your Hygge Account.",
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
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//Handling Btn press if email passed
showAlertDialogNameNotPass(BuildContext context) {
  // ignore: non_constant_identifier_names
  Widget CancelButton = TextButton(
    child: Text("Try Again"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Sorry this name is invalid.",
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
            size: 70,
            color: Colors.purple,
          ),
        ),
        Text(
          "Please Try Again.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w100, color: Colors.black),
        ),
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CancelButton],
      ),
    ],
    elevation: 50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );

  showDialog(
    context: context,
    barrierDismissible: false,
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
    title: Text("Sorry! We couldn't get your phone...",
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
          "We are sorry this phone number doesnt exist :(",
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
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//user going to be a class user with its data, now its only its image url
Future<bool?> showAlerDialogUSERFOUND(BuildContext context, String user) async {
  // ignore: non_constant_identifier_names
  Widget Aceitar = TextButton(
    child: Text(
      "Accept",
      style: TextStyle(color: Colors.white),
    ),
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFca8cdb)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)))),
    onPressed: () {
      Navigator.of(context).pushReplacementNamed("/home");
    },
  );

  Widget Recusar = TextButton(
    child: Text(
      "Deny",
      style: TextStyle(color: Colors.white),
    ),
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFca8cdb)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)))),
    onPressed: () {
      //Navigator.pushReplacementNamed(context, "/signupPhone");
      Navigator.of(context).pop(false);
    },
  );

  //AlertDialog alert =

  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("User found!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user),
                  radius: 50,
                )),
            Text(
              "Eduardo Nunes",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            Text(
              "Age, Gender",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87),
            )
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Aceitar, Recusar],
            ),
          ),
        ],
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      );
      ;
    },
  );
}
