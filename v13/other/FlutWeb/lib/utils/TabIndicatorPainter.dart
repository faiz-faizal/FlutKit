/*
* File : Tab Indicator Painter
* Version : 1.0.0
* */

import 'dart:math';
import 'package:flutter/material.dart';

class TabIndicationPainter extends CustomPainter {
  Paint painter;
  double dxTarget;
  double dxEntry;
  double radius;
  double dy;
  final double indicatorWidth, xPadding, indicatorRadius, yPadding;

  final PageController pageController;
  final Color selectedBackground;



  TabIndicationPainter({@required this.indicatorWidth,
    @required this.xPadding, @required this.indicatorRadius, @required this.yPadding,
    this.pageController, this.selectedBackground})
      : super(repaint: pageController) {
    dxTarget = this.indicatorWidth;
    dxEntry = this.xPadding;
    radius = indicatorRadius;
    dy = yPadding;
    painter = new Paint()
      ..color = selectedBackground
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final pos = pageController.position;
    double fullExtent = (pos.maxScrollExtent - pos.minScrollExtent +
        pos.viewportDimension);

    double pageOffset = pos.extentBefore / fullExtent;

    bool left2right = dxEntry < dxTarget;
    Offset entry = new Offset(left2right ? dxEntry : dxTarget, dy);
    Offset target = new Offset(left2right ? dxTarget : dxEntry, dy);

    Path path = new Path();
    path.addArc(
        new Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addRect(
        new Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(
        new Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);

    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(TabIndicationPainter oldDelegate) => true;
}