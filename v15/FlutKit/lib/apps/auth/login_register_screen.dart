/*
* File : Login & Register
* Version : 1.0.0
* */

import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_tab_indicator_painter.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LoginRegisterScreen extends StatefulWidget {
  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen>
    with SingleTickerProviderStateMixin {
  bool _passwordVisible = false;
  PageController? _pageController;
  late ThemeData themeData;
  int _selectedIndex = 0;
  Color left = Colors.black;
  Color right = Colors.white;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: themeData.colorScheme.background,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                color: themeData.colorScheme.background,
                alignment: Alignment.centerLeft,
                margin: MySpacing.x(20),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    LucideIcons.chevronLeft,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: _buildMenuBar(context),
              ),
              Expanded(
                flex: 1,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (i) {
                    if (i == 0) {
                      setState(() {
                        _selectedIndex = 0;
                        right = Colors.white;
                        left = Colors.black;
                      });
                    } else if (i == 1) {
                      setState(() {
                        _selectedIndex = 1;
                        right = Colors.black;
                        left = Colors.white;
                      });
                    }
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Padding(
                        padding: EdgeInsets.only(top: 24),
                        child: _buildSignIn(context),
                      ),
                    ),
                    ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: _buildSignUp(context),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: themeData.colorScheme.background,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: MyTabIndicationPainter(
            pageController: _pageController,
            selectedBackground: themeData.colorScheme.primary,
            indicatorWidth: 125,
            xPadding: 25,
            indicatorRadius: 20,
            yPadding: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: MyButton(
                onPressed: _onSignInButtonPress,
                backgroundColor: Colors.transparent,
                child: MyText.titleMedium("Login",
                    fontWeight: _selectedIndex == 0 ? 700 : 600,
                    color: _selectedIndex == 0
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: MyButton(
                elevation: 0,
                padding: MySpacing.x(0),
                onPressed: _onSignUpButtonPress,
                backgroundColor: Colors.transparent,
                child: MyText.titleMedium("Register",
                    fontWeight: _selectedIndex == 1 ? 700 : 600,
                    color: _selectedIndex == 1
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MyContainer.bordered(
            color: Colors.transparent,
            margin: MySpacing.x(20),
            padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 32),
            child: SizedBox(
              width: 340.0,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: MyTextStyle.bodyLarge(
                        letterSpacing: 0.1,
                        color: themeData.colorScheme.onBackground),
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: MyTextStyle.titleSmall(
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground),
                      prefixIcon: Icon(LucideIcons.mail),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      style: MyTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: MyTextStyle.titleSmall(
                            letterSpacing: 0.1,
                            color: themeData.colorScheme.onBackground),
                        prefixIcon: Icon(LucideIcons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_passwordVisible
                              ? LucideIcons.eye
                              : LucideIcons.eyeOff),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = _passwordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: _passwordVisible,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    alignment: Alignment.centerRight,
                    child:
                        MyText.bodySmall("Forgot Password ?", fontWeight: 500),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: MyButton(
                elevation: 0,
                borderRadiusAll: 4,
                onPressed: () {},
                padding: MySpacing.xy(16, 20),
                child: MyText.labelMedium("LOGIN",
                    fontWeight: 600,
                    color: themeData.colorScheme.onPrimary,
                    letterSpacing: 0.5)),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            MyContainer.bordered(
              padding:
                  EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 36),
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: MyTextStyle.bodyLarge(
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: MyTextStyle.bodyLarge(
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      prefixIcon: Icon(LucideIcons.user),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      style: MyTextStyle.bodyLarge(
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: MyTextStyle.bodyLarge(
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        prefixIcon: Icon(LucideIcons.mail),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      style: MyTextStyle.bodyLarge(
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Number",
                        hintStyle: MyTextStyle.bodyLarge(
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        prefixIcon: Icon(LucideIcons.phone),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      style: MyTextStyle.bodyLarge(
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: MyTextStyle.bodyLarge(
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        prefixIcon: Icon(LucideIcons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_passwordVisible
                              ? LucideIcons.eye
                              : LucideIcons.eyeOff),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = _passwordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: _passwordVisible,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: MyButton(
                  elevation: 0,
                  borderRadiusAll: 4,
                  onPressed: () {},
                  padding: MySpacing.xy(16, 20),
                  child: MyText.labelMedium("REGISTER",
                      fontWeight: 600,
                      color: themeData.colorScheme.onPrimary,
                      letterSpacing: 0.5)),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController!.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
