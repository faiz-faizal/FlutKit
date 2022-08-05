import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

import 'MyCol.dart';
import 'Properties.dart';
import 'ScreenMedia.dart';

class MyRow extends StatelessWidget {
  final List<MyCol> children;
  final WrapAlignment wrapAlignment;
  final WrapCrossAlignment wrapCrossAlignment;
  final Map<ScreenMediaType,int> defaultFlex;
  final double spacing,runSpacing;


  const MyRow({Key key, this.children, this.wrapAlignment, this.defaultFlex, this.wrapCrossAlignment, this.spacing, this.runSpacing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        ScreenMediaType screenMediaType =
            ScreenMedia.getScreenMediaType(constraints.maxWidth);

        List<Widget> innerChildren = [];

        for(MyCol col in children){
          if(getDisplayValue(col.display)[screenMediaType]==DisplayType.Block) {
            innerChildren.add(Container(
              padding: Spacing.x(spacing??8),
              width: getWidthFromFlex(constraints.maxWidth,
                  getFlexValue(col.flex)[screenMediaType]),
              child: col,
            ));
          }
        }
        return Wrap(
          crossAxisAlignment: wrapCrossAlignment??WrapCrossAlignment.start,
          alignment: wrapAlignment??WrapAlignment.start,
          runSpacing: runSpacing??16,
          children: innerChildren,
        );

      },
    );
  }

  double getWidthFromFlex(double width,int flex){
    return 4.1666666666 * width * flex /100;
  }

   Map<ScreenMediaType,int> getFlexValue(Map<ScreenMediaType,int> flex){
    if(flex==null)
      flex = defaultFlex ?? {ScreenMediaType.XS:ScreenMedia.GRID_COLUMNS};
    if(flex[ScreenMediaType.XS]==null){
      flex[ScreenMediaType.XS] = defaultFlex!=null ? defaultFlex[ScreenMediaType.XS]??ScreenMedia.GRID_COLUMNS : ScreenMedia.GRID_COLUMNS;
    }

    flex[ScreenMediaType.SM] = flex[ScreenMediaType.SM]??flex[ScreenMediaType.XS];
    flex[ScreenMediaType.MD] = flex[ScreenMediaType.MD]??flex[ScreenMediaType.SM];
    flex[ScreenMediaType.LG] = flex[ScreenMediaType.LG]??flex[ScreenMediaType.MD];
    flex[ScreenMediaType.XL] = flex[ScreenMediaType.XL]??flex[ScreenMediaType.LG];
    flex[ScreenMediaType.XXL] = flex[ScreenMediaType.XXL]??flex[ScreenMediaType.XL];
    flex[ScreenMediaType.XXXL] = flex[ScreenMediaType.XXXL]??flex[ScreenMediaType.XXL];
    flex[ScreenMediaType.XXXXL] = flex[ScreenMediaType.XXXXL]??flex[ScreenMediaType.XXXL];

    return flex;
  }

  Map<ScreenMediaType,DisplayType> getDisplayValue(Map<ScreenMediaType,DisplayType> display){
    if(display==null)
      display = {ScreenMediaType.XS:DisplayType.Block};
    if(display[ScreenMediaType.XS]==null)
      display[ScreenMediaType.XS] = DisplayType.Block;

    display[ScreenMediaType.SM] = display[ScreenMediaType.SM]??display[ScreenMediaType.XS];
    display[ScreenMediaType.MD] = display[ScreenMediaType.MD]??display[ScreenMediaType.SM];
    display[ScreenMediaType.LG] = display[ScreenMediaType.LG]??display[ScreenMediaType.MD];
    display[ScreenMediaType.XL] = display[ScreenMediaType.XL]??display[ScreenMediaType.LG];
    display[ScreenMediaType.XXL] = display[ScreenMediaType.XXL]??display[ScreenMediaType.XL];
    display[ScreenMediaType.XXXL] = display[ScreenMediaType.XXXL]??display[ScreenMediaType.XXL];
    display[ScreenMediaType.XXXXL] = display[ScreenMediaType.XXXXL]??display[ScreenMediaType.XXXL];



    return display;
  }



}


