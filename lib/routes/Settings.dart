import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9a33b6),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Settings",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back),
                        iconSize: 37,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Account Preferences",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("My account",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("GPS",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Terms of Privacy",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                    ),
                  ),
                  Divider(),
                ],
              ),
            )),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(top: 10),
      //   child: FloatingActionButton(
      //     child: Icon(Icons.arrow_back),
      //     onPressed: () {},
      //   ),
      // ),
    );
  }
}
