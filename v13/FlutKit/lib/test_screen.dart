import 'package:flutter/material.dart';

import 'package:flutx/widgets/icons/box_icon_data.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Icon(FxBoxIcons.bx_abacus)),
      ),
    );
  }
}
