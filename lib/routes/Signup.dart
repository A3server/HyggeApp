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

class Signup extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Map<dynamic, dynamic> GetFromUCAPI(String email) {
    //No access to UC API :(
    //Com a parceria de Universidades poderiamos obter acesso!

    //PlaceHolder for real database:
    //Para simular o acesso a uma database criei este pequeno dicionário que seria a resposta da API com o Email:
    Map response = {
      //TODO: THIS IS A PLACEHOLDER NOT THE REAL API WE WILL BE USING.
      'uc20201@student.uc.pt': {
        'Nome': 'Eduardo Nunes',
        'HIGGEID': "HIGGEID20201",
        'Gen': 'M',
      },
      'uc2020900@student.uc.pt': {
        'Nome': 'Vasco Gouveia',
        'HIGGEID': "HIGGEID20209000",
        'Gen': 'M',
      }
    };
    if (response[email] != null) {
      return response[email];
    } else {
      throw NullThrownError();
    }
  }

  bool passed = false;

  bool checkAndSaveEmail(String email) {
    bool validE = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (validE) {
      //Saving data quick
      var user;
      //Teoricamente isto seria uma async function:
      try {
        user = GetFromUCAPI(email);
        saveDatafast('UserName', user['Nome']);
        saveDatafast('UserUCEmail', email);
        saveDatafast('UserHIGGEID', user['HIGGEID']);
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
                        const EdgeInsets.only(top: 0.0, left: 20, right: 20),
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
                    padding: const EdgeInsets.all(45.0),
                    child: Text(
                      "Give us your email and we will do the rest!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
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
                                  hintText: 'Your Student Email',
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
                          passed = checkAndSaveEmail(box1.text);
                          if (passed) {
                            showAlertDialogPass(context);
                          } else {
                            showAlertDialogNOTPASS(context);
                          }
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
                    padding: const EdgeInsets.only(top: 30.0),
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
                      "Click here to resend the email",
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
