import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

mixin FxNavigationMixin on FxController {
  Future<T?> push<T>(Widget widget) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  Future<T?> pushReplacement<T>(Widget widget) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  Future<T?> pushAndPopAll<T>(Widget widget) {
    Navigator.popUntil(context, (route) => route.isFirst);
    return pushReplacement<T>(widget);
  }

  void goBack<T>([T? result]) {
    return Navigator.pop<T>(context, result);
  }
}
