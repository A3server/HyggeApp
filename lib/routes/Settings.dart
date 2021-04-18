import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsOnePage extends StatefulWidget {
  const SettingsOnePage({Key? key}) : super(key: key);
  @override
  _SettingsOnePageState createState() => _SettingsOnePageState();
}

class _SettingsOnePageState extends State<SettingsOnePage> {

  // ignore: non_constant_identifier_names
  String AccountName = "placeholder";
  // ignore: non_constant_identifier_names
  String HIGGEID = "placeholder";

  bool _toggled1 = false;


  @override
  void initState() {
    super.initState();
  }

  readandsetlsvalues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      AccountName = (prefs.getString('UserName') ?? 0).toString();
      HIGGEID = (prefs.getString('UserHIGGEID') ?? 0).toString();
    });
  }
  clearlocalstorage() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove('UserName');
    prefs.remove('UserHIGGEID');
    prefs.remove('UserKey'); //Quando implementarmos a firebase
    prefs.remove('UserPhone');

    //TODO: send logout token to firebase
    Navigator.pushReplacementNamed(context, "/signupName");
  }

  @override
  Widget build(BuildContext context) {
    readandsetlsvalues();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back,size: 35.0,color: Colors.black),
          onPressed: () => {
            // Perform Your action here
            Navigator.of(context).pop()
          },
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.normal, fontSize: 40),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.purple,
                  child: ListTile(
                    onTap: () {
                      //open edit profile
                    },
                    title: Text(
                      "$AccountName",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://ssbworld.com/images/character-profiles/rounded/Jigglypuff-Profile-Round.png"),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.purple,
                        ),
                        title: Text("Change HIGGEID"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change password
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.language,
                          color: Colors.purple,
                        ),
                        title: Text("Change Language"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change language
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.radio_button_checked_rounded,
                          color: Colors.purple,
                        ),
                        title: Text("Change Match Radius"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change location
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Match Settings",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                SwitchListTile(
                  activeColor: Colors.purple,
                  contentPadding: const EdgeInsets.all(0),
                  value: _toggled1,
                  title: Text(
                      "Match users of different gender",
                      style: Theme.of(context).textTheme.headline2
                  ),
                  onChanged: (bool val) {
                    setState(() {
                      _toggled1 = val;
                    });
                  },
                ),
                SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text(
                        "Connect email to account",
                        style: Theme.of(context).textTheme.headline2
                    ),
                    onChanged: null
                ),
                SwitchListTile(
                  activeColor: Colors.purple,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text("Received App Updates",
                      style: Theme.of(context).textTheme.headline2
                  ),
                  onChanged: null,
                ),
                const SizedBox(height: 60.0),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:525.0),
              child: Container(
                child: IconButton(
                  icon: Icon(
                    Icons.power_settings_new_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    clearlocalstorage();
                    Navigator.pushReplacementNamed(context, "/signupName");
                  },
                ),
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}