import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:clipboard_manager/clipboard_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool result = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text('Your coupon is xYZ1234AB'),
                  RaisedButton(
                    child: Text('Copy to Clipboard'),
                    onPressed: () {
                      ClipboardManager.copyToClipBoard("xYZ1234AB").then((result) {
                        final snackBar = SnackBar(
                          content: Text('Copied to Clipboard'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      });
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
