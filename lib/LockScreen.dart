import 'package:flutter/material.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import './main.dart';
import './api.dart';

class PassCodeScreen extends StatefulWidget {
  PassCodeScreen({Key key, this.title, this.api}) : super(key: key);

  final String title;
  final Api api;
  @override
  _PassCodeScreenState createState() => new _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> {

  @override
  Widget build(BuildContext context) {
    List<int> myPass = [2, 5, 5, 6, 5];
    /*widget.api.getPCode().then((pass) => {
      myPass = pass
    });*/
    print(myPass);
    print(myPass.length);
    return LockScreen(
        title: "This is Screet ",
        passLength: myPass.length,
        bgImage: "assets/blank.png",
        borderColor: Colors.white,
        showWrongPassDialog: true,
        wrongPassContent: "Wrong pass please try again.",
        wrongPassTitle: "Opps!",
        wrongPassCancelButtonText: "Cancel",
        passCodeVerify: (passcode) async {
          for (int i = 0; i < myPass.length; i++) {
            if (passcode[i] != myPass[i]) {
              return false;
            }
          }

          return true;
        },
        onSuccess: () {
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (BuildContext context) {
            return EndpointSelectPage(title: 'Select an endpoint');
          }));
        });
  }
}