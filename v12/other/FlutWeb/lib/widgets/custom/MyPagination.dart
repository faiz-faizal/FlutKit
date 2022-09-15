import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../AppTheme.dart';

typedef void OnPageChanged(int page);

class MyPagination extends StatefulWidget {
  final int initialPage, maxPage;
  final OnPageChanged onPageChanged;

  const MyPagination(
      {Key key, this.initialPage = 1, this.maxPage = 10, this.onPageChanged})
      : super(key: key);

  @override
  _MyPaginationState createState() => _MyPaginationState();
}

class _MyPaginationState extends State<MyPagination> {
  //ThemeData
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  //Variables
  int initialPage;
  int currentPage;
  int maxPage;

  @override
  void initState() {
    super.initState();
    initialPage = widget.initialPage;
    currentPage = initialPage;
    maxPage = widget.maxPage;
  }

  @override
  Widget build(BuildContext context) {
    themeData = AppTheme.getThemeFromThemeMode(1);
    customAppTheme = AppTheme.getCustomAppTheme(1);

    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: buildPagination(),
      ),
    );
  }

  buildPagination() {
    List<Widget> list = [];

    list.add(singleIndicator(pageNo: "<<", disabled: currentPage < 2));
    list.add(Spacing.width(8));

    int initIndex = currentPage == 1
        ? 1
        : (currentPage == maxPage ? currentPage - 2 : currentPage - 1);
    int lastIndex = currentPage == 1
        ? currentPage + 2
        : (currentPage == maxPage ? maxPage : currentPage + 1);

    for (int i = initIndex; i <= lastIndex; i++) {
      list.add(InkWell(
        onTap: () {

        },
        child:
            singleIndicator(pageNo: i.toString(), selected: currentPage == i),
      ));
      list.add(Spacing.width(8));
    }

    list.add(singleIndicator(pageNo: ">>", disabled: currentPage >= maxPage));

    return list;
  }

  Widget singleIndicator(
      {bool disabled = false, String pageNo = "1", bool selected = false}) {
    if (pageNo == ">") {
      return MyContainer.roundBordered(
          onTap: () {
            if (currentPage < maxPage) {
              setState(() {
                currentPage++;
              });
              if (widget.onPageChanged != null)
                widget.onPageChanged(currentPage);
            }
          },
          height: 40,
          width: 40,
          paddingAll: 0,
          alignment: Alignment.center,
          color: disabled ? customAppTheme.bgLayer2 : null,
          child: Icon(
            MdiIcons.chevronRight,
            size: 18,
            color: themeData.colorScheme.onBackground,
          ));
    }
    else if (pageNo == "<") {
      return MyContainer.roundBordered(
          onTap: () {
            if (currentPage > 1) {
              setState(() {
                currentPage--;
              });
              if (widget.onPageChanged != null)
                widget.onPageChanged(currentPage);
            }
          },
          height: 40,
          width: 40,
          paddingAll: 0,
          color: disabled ? customAppTheme.bgLayer2 : customAppTheme.bgLayer1,
          child: Center(
            child: Icon(
              MdiIcons.chevronLeft,
              size: 18,
              color: themeData.colorScheme.onBackground,
            ),
          ));
    }
    else if(pageNo == ">>") {
      return MyContainer.roundBordered(
          onTap: () {
            if (currentPage < maxPage) {
              setState(() {
                currentPage=maxPage;
              });
              if (widget.onPageChanged != null)
                widget.onPageChanged(currentPage);
            }
          },
          height: 40,
          width: 40,
          paddingAll: 0,
          alignment: Alignment.center,
          color: disabled ? customAppTheme.bgLayer2 : null,
          child: Icon(
            MdiIcons.chevronDoubleRight,
            size: 18,
            color: themeData.colorScheme.onBackground,
          ));
    }
    else if (pageNo == "<<") {
      return MyContainer.roundBordered(
          onTap: () {
            if (currentPage > 1) {
              setState(() {
                currentPage=initialPage;
              });
              if (widget.onPageChanged != null)
                widget.onPageChanged(currentPage);
            }
          },
          height: 40,
          width: 40,
          paddingAll: 0,
          color: disabled ? customAppTheme.bgLayer2 : customAppTheme.bgLayer1,
          child: Center(
            child: Icon(
              MdiIcons.chevronDoubleLeft,
              size: 18,
              color: themeData.colorScheme.onBackground,
            ),
          ));
    }
    return MyContainer.rounded (
      onTap: (){
        setState(() {
          currentPage = int.tryParse(pageNo)??widget.initialPage;
        });
        if (widget.onPageChanged != null) widget.onPageChanged(currentPage);
      },
        height: 40,
        width: 40,
        paddingAll: 0,
        color: selected ? themeData.colorScheme.primary : null,
        bordered: !selected,
        child: Center(
          child: Text(
            pageNo,
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                color: selected
                    ? themeData.colorScheme.onPrimary
                    : themeData.colorScheme.onBackground),
          ),
        ));
  }
}
