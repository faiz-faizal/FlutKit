
import 'package:flutkit/style/Properties.dart';
import 'package:flutter/material.dart';

import 'ScreenMedia.dart';



class MyCol extends StatefulWidget {
  final Widget child;
  final Map<ScreenMediaType,int> flex;
  final Map<ScreenMediaType,DisplayType> display;


  MyCol({Key key, @required this.child, this.flex, this.display,});

  @override
  _MyColState createState() => _MyColState();


}

class _MyColState extends State<MyCol> {


  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
