import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatCreateGroupScreen extends StatefulWidget {
  @override
  _ChatCreateGroupScreenState createState() => _ChatCreateGroupScreenState();
}

class _ChatCreateGroupScreenState extends State<ChatCreateGroupScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _list = List.generate(6, (index) => false);
  }

  late List<bool> _list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                LucideIcons.chevronLeft,
                color: theme.colorScheme.onBackground,
                size: 22,
              )),
          title: MyText.titleMedium("Create Group",
              color: theme.colorScheme.onBackground, fontWeight: 600),
          centerTitle: true,
        ),
        body: Column(
          children: [
            MyContainer(
              margin: MySpacing.fromLTRB(20, 0, 20, 0),
              borderRadiusAll: 4,
              paddingAll: 8,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: TextFormField(
                        style: MyTextStyle.bodyMedium(
                            letterSpacing: 0,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "Search messages",
                          hintStyle: MyTextStyle.bodyMedium(
                              letterSpacing: 0,
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        textInputAction: TextInputAction.search,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Icon(
                        LucideIcons.search,
                        color: theme.colorScheme.onPrimary,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: MySpacing.fromLTRB(20, 0, 20, 0),
                child: ListView(
                  padding: MySpacing.zero,
                  children: [
                    singleContact(
                        clickedOption: "Added",
                        index: 3,
                        image: './assets/images/profile/avatar_4.jpg',
                        name: 'Andrei Ratcliffe',
                        option: "Add",
                        isActive: true,
                        status: "2 Mutual groups"),
                    singleContact(
                        clickedOption: "Added",
                        index: 4,
                        image: './assets/images/profile/avatar_5.jpg',
                        name: 'Lowri Gould',
                        option: "Add",
                        status: "3 Mutual groups"),
                    singleContact(
                        clickedOption: "Added",
                        index: 5,
                        image: './assets/images/profile/avatar.jpg',
                        name: 'Samson Bains',
                        option: "Add",
                        isActive: true,
                        status: "1 Mutual group"),
                    singleContact(
                        clickedOption: "Invited",
                        index: 0,
                        image: './assets/images/profile/avatar_2.jpg',
                        isActive: true,
                        name: 'Reanne Dudley',
                        option: "Invite",
                        status: "3 Mutual friends"),
                    singleContact(
                        clickedOption: "Invited",
                        index: 1,
                        image: './assets/images/profile/avatar_1.jpg',
                        name: 'Calista Garcia',
                        option: "Invite",
                        status: "8 Mutual friends"),
                    singleContact(
                        clickedOption: "Invited",
                        index: 2,
                        image: './assets/images/profile/avatar_3.jpg',
                        name: 'Samson Bains',
                        option: "Invite",
                        status: "Unknown"),
                  ],
                ),
              ),
            ),
            MyContainer.bordered(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              padding: MySpacing.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      singleOption(
                          option: "Profile", iconData: LucideIcons.image),
                      singleOption(
                          option: "Setting", iconData: LucideIcons.cog),
                      singleOption(option: "Copy", iconData: LucideIcons.copy),
                    ],
                  ),
                  Container(
                    margin: MySpacing.top(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: customTheme.card,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            padding: MySpacing.all(6),
                            child: TextFormField(
                              style: MyTextStyle.bodyMedium(
                                  letterSpacing: 0,
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Group Name",
                                hintStyle: MyTextStyle.bodyMedium(
                                    letterSpacing: 0,
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    borderSide: BorderSide.none),
                                isDense: true,
                                contentPadding: MySpacing.fromLTRB(8, 8, 8, 8),
                              ),
                              textInputAction: TextInputAction.search,
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ),
                        ),
                        Container(
                          margin: MySpacing.left(20),
                          child: SizedBox(
                            height: 44,
                            width: 44,
                            child: FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: theme.colorScheme.primary,
                              mini: true,
                              child: Container(
                                padding: MySpacing.all(4),
                                child: Icon(LucideIcons.check,
                                    color: theme.colorScheme.onPrimary),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget singleContact(
      {required String image,
      required int index,
      required String name,
      required String status,
      String? option,
      String? clickedOption,
      bool isActive = false}) {
    return Container(
      margin: MySpacing.top(20),
      child: InkWell(
        onTap: () {
          _showBottomSheet(context);
        },
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image(
                    image: AssetImage(image),
                    height: 44,
                    width: 44,
                    fit: BoxFit.cover,
                  ),
                ),
                isActive
                    ? Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: customTheme.card, width: 2),
                              shape: BoxShape.circle),
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: customTheme.colorSuccess,
                                shape: BoxShape.circle),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Expanded(
              child: Container(
                margin: MySpacing.left(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.bodyLarge(
                      name,
                    ),
                    MyText.bodySmall(
                      status,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _list[index] = !_list[index];
                });
              },
              child: Container(
                padding: MySpacing.fromLTRB(16, 8, 16, 8),
                decoration: _list[index]
                    ? BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(
                          color: customTheme.border,
                        ))
                    : BoxDecoration(
                        color: customTheme.card,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                child: MyText.bodySmall(_list[index] ? clickedOption! : option!,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                    letterSpacing: 0),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodySmall("NAME",
                            fontSize: 12,
                            fontWeight: 700,
                            muted: true,
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.5),
                        MyText.bodyLarge("Elysia Baldwin",
                            fontWeight: 600,
                            color: theme.colorScheme.onBackground),
                      ],
                    ),
                    Container(
                      margin: MySpacing.top(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodySmall("CITY",
                              fontSize: 12,
                              fontWeight: 700,
                              muted: true,
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.5),
                          MyText.bodyLarge("Dubai",
                              fontWeight: 600,
                              color: theme.colorScheme.onBackground),
                        ],
                      ),
                    ),
                    Container(
                      margin: MySpacing.top(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodySmall("EMAIL",
                              fontSize: 12,
                              fontWeight: 700,
                              muted: true,
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.5),
                          MyText.bodyLarge("elysin12@gmail.com",
                              fontWeight: 600,
                              color: theme.colorScheme.onBackground),
                        ],
                      ),
                    ),
                    Container(
                      margin: MySpacing.top(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodySmall("NUMBER",
                              fontSize: 12,
                              fontWeight: 700,
                              muted: true,
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.5),
                          MyText.bodyLarge("(91) 9876543210",
                              fontWeight: 600,
                              color: theme.colorScheme.onBackground),
                        ],
                      ),
                    ),
                    MySpacing.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                          padding: MySpacing.xy(16, 16),
                          elevation: 0,
                          borderRadiusAll: 4,
                          onPressed: () {},
                          child: MyText(
                            "Add to Group",
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                        MyButton.text(
                          elevation: 0,
                          padding: MySpacing.xy(16, 12),
                          borderRadiusAll: 4,
                          onPressed: () {},
                          child: MyText.bodyMedium("Cancel Request",
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget singleOption({IconData? iconData, required String option}) {
    return Container(
      width: (MediaQuery.of(context).size.width - 120) / 3,
      padding: MySpacing.all(20),
      decoration: BoxDecoration(
          color: theme.colorScheme.primary.withAlpha(28),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: [
          Icon(
            iconData,
            color: theme.colorScheme.primary,
            size: 22,
          ),
          Container(
            margin: MySpacing.top(8),
            child: MyText.bodyMedium(
              option,
              fontSize: 12,
              color: theme.colorScheme.primary,
              fontWeight: 600,
            ),
          )
        ],
      ),
    );
  }
}
