import 'package:flutkit/full_apps/other/medicare/models/category.dart';
import 'package:flutkit/full_apps/other/medicare/models/doctor.dart';
import 'package:flutkit/full_apps/other/medicare/single_doctor_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_star_rating.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MediCareHomeScreen extends StatefulWidget {
  @override
  _MediCareHomeScreenState createState() => _MediCareHomeScreenState();
}

class _MediCareHomeScreenState extends State<MediCareHomeScreen> {
  int selectedCategory = 0;
  List<Category> categoryList = [];
  List<Doctor> doctorList = [];
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    categoryList = Category.categoryList();
    doctorList = Doctor.doctorList();
  }

  Widget _buildSingleCategory(
      {int? index, String? categoryName, IconData? categoryIcon}) {
    return Padding(
      padding: MySpacing.right(16),
      child: MyContainer(
        paddingAll: 8,
        borderRadiusAll: 8,
        bordered: true,
        border: Border.all(color: customTheme.border, width: 1),
        color: selectedCategory == index
            ? customTheme.card
            : theme.scaffoldBackgroundColor,
        onTap: () {
          setState(() {
            selectedCategory = index!;
          });
        },
        child: Row(
          children: [
            MyContainer.rounded(
              color: theme.colorScheme.onBackground.withAlpha(16),
              paddingAll: 4,
              child: Icon(
                categoryIcon,
                color: customTheme.medicarePrimary,
                size: 16,
              ),
            ),
            MySpacing.width(8),
            MyText.labelMedium(
              categoryName!,
              fontWeight: 600,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCategoryList() {
    List<Widget> list = [];

    list.add(MySpacing.width(24));

    for (int i = 0; i < categoryList.length; i++) {
      list.add(_buildSingleCategory(
          index: i,
          categoryName: categoryList[i].category,
          categoryIcon: categoryList[i].categoryIcon));
    }
    return list;
  }

  List<Widget> _buildDoctorList() {
    List<Widget> list = [];

    list.add(MySpacing.width(16));

    for (int i = 0; i < doctorList.length; i++) {
      list.add(_buildSingleDoctor(doctorList[i]));
    }
    return list;
  }

  Widget _buildSingleDoctor(Doctor doctor) {
    return MyContainer(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (context) => MediCareSingleDoctorScreen(doctor)));
      },
      margin: MySpacing.fromLTRB(24, 0, 24, 16),
      paddingAll: 16,
      borderRadiusAll: 8,
      child: Row(
        children: [
          MyContainer(
            paddingAll: 0,
            borderRadiusAll: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image(
                width: 72,
                height: 72,
                image: AssetImage(doctor.image),
              ),
            ),
          ),
          MySpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyLarge(
                  doctor.name,
                  fontWeight: 600,
                ),
                MySpacing.height(4),
                MyText.bodySmall(
                  doctor.category,
                  xMuted: true,
                ),
                MySpacing.height(12),
                Row(
                  children: [
                    MyStarRating(
                      rating: doctor.ratings,
                      showInactive: true,
                      size: 15,
                      inactiveColor:
                          theme.colorScheme.onBackground.withAlpha(180),
                    ),
                    MySpacing.width(4),
                    MyText.bodySmall(
                      '${doctor.ratings} | ${doctor.reviews} Reviews',
                      xMuted: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: MySpacing.top(48),
        children: [
          Padding(
            padding: MySpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MySpacing.width(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText.bodySmall(
                      'Current Location',
                      color: theme.colorScheme.onBackground,
                      xMuted: true,
                      fontSize: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: customTheme.medicarePrimary,
                          size: 12,
                        ),
                        MySpacing.width(4),
                        MyText.bodySmall(
                          'Semarang, INA',
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                        ),
                      ],
                    ),
                  ],
                ),
                MyContainer(
                  paddingAll: 4,
                  borderRadiusAll: 4,
                  color: customTheme.card,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Icon(
                        LucideIcons.bell,
                        size: 20,
                        color: theme.colorScheme.onBackground.withAlpha(200),
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: MyContainer.rounded(
                          paddingAll: 4,
                          color: customTheme.medicarePrimary,
                          child: Container(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          MySpacing.height(24),
          Padding(
            padding: MySpacing.horizontal(24),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Search a doctor or health issue",
                hintText: "Search a doctor or health issue",
                labelStyle: MyTextStyle.getStyle(
                    color: customTheme.medicarePrimary,
                    fontSize: 12,
                    fontWeight: 600,
                    muted: true),
                hintStyle: MyTextStyle.getStyle(
                    color: customTheme.medicarePrimary,
                    fontSize: 12,
                    fontWeight: 600,
                    muted: true),
                fillColor: customTheme.card,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                contentPadding: MySpacing.all(16),
                prefixIcon: Icon(
                  LucideIcons.search,
                  size: 20,
                ),
                prefixIconColor: customTheme.medicarePrimary,
                focusColor: customTheme.medicarePrimary,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              cursorColor: customTheme.medicarePrimary,
              autofocus: false,
            ),
          ),
          MySpacing.height(24),
          Padding(
            padding: MySpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.bodyMedium(
                  'Upcoming Schedule',
                  fontWeight: 700,
                ),
                MyText.bodySmall(
                  'See all',
                  color: customTheme.medicarePrimary,
                  fontSize: 10,
                ),
              ],
            ),
          ),
          MySpacing.height(24),
          MyContainer(
            borderRadiusAll: 8,
            margin: MySpacing.horizontal(24),
            color: customTheme.medicarePrimary,
            child: Column(
              children: [
                Row(
                  children: [
                    MyContainer(
                      paddingAll: 0,
                      borderRadiusAll: 8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image(
                          height: 40,
                          width: 40,
                          image: AssetImage(
                            'assets/images/profile/avatar_3.jpg',
                          ),
                        ),
                      ),
                    ),
                    MySpacing.width(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodySmall(
                            'Dr.Haley lawrence',
                            color: customTheme.medicareOnPrimary,
                            fontWeight: 700,
                          ),
                          MyText.bodySmall(
                            'Dermatologists',
                            fontSize: 10,
                            color: customTheme.medicareOnPrimary.withAlpha(200),
                          ),
                        ],
                      ),
                    ),
                    MySpacing.width(16),
                    MyContainer.rounded(
                      paddingAll: 4,
                      color: customTheme.medicareOnPrimary,
                      child: Icon(
                        Icons.videocam_outlined,
                        color: customTheme.medicarePrimary,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                MySpacing.height(16),
                MyContainer(
                  borderRadiusAll: 8,
                  color: theme.colorScheme.onBackground.withAlpha(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.watch_later,
                        color: customTheme.medicareOnPrimary.withAlpha(160),
                        size: 20,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall(
                        'Sun, Jan 19, 08:00am - 10:00am',
                        color: customTheme.medicareOnPrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MySpacing.height(24),
          Padding(
            padding: MySpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.bodyMedium(
                  'Let\'s find your doctor',
                  fontWeight: 700,
                ),
                Icon(
                  Icons.tune_outlined,
                  color: customTheme.medicarePrimary,
                  size: 20,
                ),
              ],
            ),
          ),
          MySpacing.height(24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildCategoryList(),
            ),
          ),
          MySpacing.height(16),
          Column(
            children: _buildDoctorList(),
          ),
        ],
      ),
    );
  }
}
