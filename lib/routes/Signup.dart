import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:HyggeApp/components/Popups.dart';

void saveDatafast(String Key, String name) async {
  //função para salvar os varios tipos de dados obtidos muito rapidamente com uma chave e nome
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(Key, name);
  // ? print('Saved: $Key--$name');
}
//Setting state
class Signup extends StatefulWidget {
  @override
  Signupstate createState() => Signupstate();
}

bool checkAndSaveEmail(String email) {
  bool validE = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  if (validE) {
    //Teoricamente isto seria uma async function:
    try {
      saveDatafast('UserEmail', email);
      return true;
    } catch (err) {
      print("Email valido mas Err from API: $err");
      return false;
    }
  } else {
    //invalido email.
    print("Email mal escrito");
    return false;
  }
}
bool checkAndSaveName(String name) {
  bool validE = RegExp(r"([a-zA-Z',.-]+( [a-zA-Z',.-]+)*){2,30}")
      .hasMatch(name);

  if (validE) {
    //Teoricamente isto seria uma async function:
    try {
      saveDatafast('UserName', name);
      return true;
    } catch (err) {
      print("Nome valido mas Err from phone: $err");
      return false;
    }
  } else {
    //invalido email.
    print("Nome mal escrito");
    return false;
  }
}
bool checkAndSavePhone(String phone){
  bool validE = RegExp(r"(9[1236][0-9]) ?([0-9]{3}) ?([0-9]{3})")
      .hasMatch(phone);

  if (validE) {
    //Teoricamente isto seria uma async function:
    try {
      saveDatafast('UserPhone', phone);
      return true;
    } catch (err) {
      print("phone valido mas Err from machine: $err");
      return false;
    }
  } else {
    //invalido email.
    print("phone mal escrito");
    return false;
  }
}

class Signupstate extends State<Signup> {
  // ignore: non_constant_identifier_names
  final box1 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            //!!!!! para o teclado nao dar overlap nem problemas de overflow
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 20.0, left: 20, right: 20,bottom:10),
                    child: Text(
                      "Tell us your name!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 0.0, left: 10, right: 10),
                    child: Text(
                      "This name will be seen by other users",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 290,
                            height: 60,
                            child: TextField(
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              controller: box1,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'Your Name',
                                  filled: true,
                                  fillColor: Colors.grey[20]),
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 290,
                      child: TextButton(
                        onPressed: () {
                          //Setting up AlertDialog
                          setState(() {
                            checkAndSaveName(box1.text) ? showAlertDialogPassName(context) : showAlertDialogNameNotPass(context);
                          });
                        },
                        child: Text("NEXT",
                            style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.normal,
                                color: Colors.white)),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF9a33b6), //normal color
                          primary: Color(0xFF631d77), //onclick color
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class Signup2 extends StatelessWidget{
  final box2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            //!!!!! para o teclado nao dar overlap nem problemas de overflow
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 4.0, left: 20, right: 20,bottom:10),
                    child: Text(
                      "Please enter your phone number!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 0.0, left: 20, right: 20),
                    child: Text(
                      "A code will be sent shortly",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 290,
                            height: 60,
                            child: TextField(
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              controller: box2,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'Your phone number',
                                  filled: true,
                                  fillColor: Colors.grey[20]),
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 290,
                      child: TextButton(
                        onPressed: () {
                          //Setting up AlertDialog
                          checkAndSavePhone(box2.text) ? showAlertDialogPass(context) : showAlertDialogNOTPASS(context);
                        },
                        child: Text("NEXT",
                            style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.normal,
                                color: Colors.white)),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF9a33b6), //normal color
                          primary: Color(0xFF631d77), //onclick color
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class SignupData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            //!!!!! para o teclado nao dar overlap nem problemas de overflow
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 0.0, left: 20, right: 20),
                    child: Text(
                      "Verification",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "Insert the code received on your phone!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 336,
                            height: 60,
                            child: TextField(
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'Verification Code',
                                  filled: true,
                                  fillColor: Colors.grey[20]),
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 336,
                      child: TextButton(
                        onPressed: () {
                          //TODO: Firebase validation check
                          Navigator.pushReplacementNamed(context, "/home");
                        },
                        child: Text("VERIFY",
                            style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.normal,
                                color: Colors.white)),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF9a33b6), //normal color
                          primary: Color(0xFF631d77), //onclick color
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      "Click here to resend the code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.deepPurple,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
