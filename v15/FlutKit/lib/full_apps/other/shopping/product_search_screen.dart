import 'dart:async';

import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_star_rating.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProductsSearchScreen extends StatefulWidget {
  @override
  _ProductsSearchScreenState createState() => _ProductsSearchScreenState();
}

class _ProductsSearchScreenState extends State<ProductsSearchScreen> {
  bool _isInProgress = false;
  Timer? _timer;

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    WidgetsBinding.instance.addPostFrameCallback((_) => startTimer());
  }

  void _onSubmit(text) {
    startTimer();
  }

  void startTimer() {
    setState(() {
      _isInProgress = true;
    });
    const Duration oneSec = const Duration(milliseconds: 2500);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer!.cancel(),
              setState(
                () {
                  _isInProgress = false;
                },
              )
            });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        MySpacing.height(48),
        MyContainer(
          margin: MySpacing.x(16),
          padding: MySpacing.xy(12, 4),
          child: Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    LucideIcons.chevronLeft,
                    size: 24,
                    color: theme.colorScheme.onBackground,
                  )),
              MySpacing.width(16),
              Expanded(
                child: TextFormField(
                  onFieldSubmitted: _onSubmit,
                  decoration: InputDecoration(
                    hintText: 'Try to search...',
                    hintStyle: MyTextStyle.bodyMedium(),
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.search,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 1,
                  style: MyTextStyle.bodyMedium(),
                ),
              ),
              // Expanded(
              //   child: MyTextField(
              //     hintText: "Try to Search",
              //     hintStyle: MyTextStyle.bodyMedium(),
              //     labelStyle: MyTextStyle.bodyMedium(),
              //     style: MyTextStyle.bodyMedium(),
              //     autoIcon: false,
              //     autofocus: false,
              //     maxLines: 1,
              //     textInputAction: TextInputAction.search,
              //     textCapitalization: TextCapitalization.sentences,
              //     onSubmitted: _onSubmit,
              //   ),
              // ),
            ],
          ),
        ),
        MySpacing.height(16),
        Expanded(
          child: _isInProgress
              ? Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.primary,
                  )),
                )
              : ListView(
                  padding: MySpacing.zero,
                  children: <Widget>[
                    Container(
                      padding: MySpacing.x(16),
                      child: MyText.bodyMedium("Result", fontWeight: 600),
                    ),
                    Container(
                      padding: MySpacing.nBottom(16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: _SimpleCard(
                            image:
                                './assets/images/apps/shopping/product/product-7.jpg',
                            name: 'Product-1',
                            description:
                                'Lorem ipsum, or lipsum as it is sometimes',
                            star: 4,
                            countStar: 15,
                          )),
                          MySpacing.width(16),
                          Expanded(
                              child: _SimpleCard(
                            image:
                                './assets/images/apps/shopping/product/product-8.jpg',
                            name: 'Product-1',
                            description:
                                'Lorem ipsum, or lipsum as it is sometimes',
                            star: 5,
                            countStar: 2,
                          )),
                        ],
                      ),
                    ),
                    Container(
                      padding: MySpacing.nBottom(16),
                      child: MyText.bodyMedium("Recommended", fontWeight: 600),
                    ),
                    MySpacing.height(16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          MySpacing.width(16),
                          _SimpleCard(
                            image:
                                './assets/images/apps/shopping/product/product-3.jpg',
                            name: 'Product-1',
                            description:
                                'Lorem ipsum, or lipsum as it is sometimes',
                            star: 4,
                            countStar: 15,
                            width: 160,
                          ),
                          MySpacing.width(16),
                          _SimpleCard(
                            image:
                                './assets/images/apps/shopping/product/product-5.jpg',
                            name: 'Product-1',
                            description:
                                'Lorem ipsum, or lipsum as it is sometimes',
                            star: 5,
                            countStar: 2,
                            width: 160,
                          ),
                          MySpacing.width(16),
                          _SimpleCard(
                            image:
                                './assets/images/apps/shopping/product/product-2.jpg',
                            name: 'Product-1',
                            description:
                                'Lorem ipsum, or lipsum as it is sometimes',
                            star: 5,
                            countStar: 2,
                            width: 160,
                          ),
                          MySpacing.width(16),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ],
    ));
  }
}

class _SimpleCard extends StatefulWidget {
  final String? image, name, description;
  final int? star, countStar;
  final double? width;

  const _SimpleCard({
    Key? key,
    this.image,
    this.name,
    this.description,
    this.star,
    this.countStar,
    this.width,
  }) : super(key: key);

  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<_SimpleCard> {
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      paddingAll: 0,
      clipBehavior: Clip.hardEdge,
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(widget.image!),
            width: widget.width ?? MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          MyContainer(
            paddingAll: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyText.bodyMedium(widget.name!),
                MySpacing.height(2),
                MyText.bodySmall(
                  widget.description!,
                  letterSpacing: 0.15,
                  height: 1.2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                MySpacing.height(2),
                Row(
                  children: <Widget>[
                    MyStarRating(
                        rating: widget.star!.toDouble(),
                        inactiveColor: Generator.starColor),
                    MySpacing.width(4),
                    MyText.bodyMedium("(${widget.countStar})",
                        letterSpacing: 0.2)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
