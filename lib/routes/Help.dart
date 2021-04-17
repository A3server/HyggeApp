import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Help",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 37,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )),
              ]),
            )
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
