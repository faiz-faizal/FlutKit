import 'package:flutkit/full_apps/other/medicare/appointment_screen.dart';
import 'package:flutkit/full_apps/other/medicare/models/chat.dart';
import 'package:flutkit/full_apps/other/medicare/models/doctor.dart';
import 'package:flutkit/full_apps/other/medicare/single_chat_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MediCareSingleDoctorScreen extends StatefulWidget {
  final Doctor doctor;

  const MediCareSingleDoctorScreen(this.doctor);

  @override
  _MediCareSingleDoctorScreenState createState() =>
      _MediCareSingleDoctorScreenState();
}

class _MediCareSingleDoctorScreenState
    extends State<MediCareSingleDoctorScreen> {
  late Doctor doctor;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    doctor = widget.doctor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: MySpacing.fromLTRB(24, 44, 24, 24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: MyContainer(
                  paddingAll: 4,
                  borderRadiusAll: 8,
                  child: Icon(
                    Icons.chevron_left,
                    color: theme.colorScheme.onBackground.withAlpha(160),
                    size: 24,
                  ),
                ),
              ),
              MyContainer.rounded(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MediCareSingleChatScreen(
                        Chat(doctor.image, doctor.name, '', '', '', false),
                      ),
                    ),
                  );
                },
                paddingAll: 8,
                child: Icon(
                  LucideIcons.messageCircle,
                  color: theme.colorScheme.onBackground.withAlpha(160),
                  size: 20,
                ),
              ),
            ],
          ),
          MySpacing.height(32),
          Row(
            children: [
              MyContainer(
                paddingAll: 0,
                borderRadiusAll: 16,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Image(
                    fit: BoxFit.cover,
                    height: 160,
                    width: 120,
                    image: AssetImage(doctor.image),
                  ),
                ),
              ),
              MySpacing.width(24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.bodyLarge(
                      doctor.name,
                      fontWeight: 700,
                      fontSize: 18,
                    ),
                    MySpacing.height(8),
                    MyText.bodyMedium(
                      doctor.category,
                      color: theme.colorScheme.onBackground,
                      xMuted: true,
                    ),
                    MySpacing.height(12),
                    Row(
                      children: [
                        MyContainer(
                          paddingAll: 8,
                          child: Icon(
                            Icons.star_rounded,
                            color: AppTheme.customTheme.colorWarning,
                          ),
                        ),
                        MySpacing.width(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.bodySmall(
                              'Rating',
                              color: theme.colorScheme.onBackground,
                              xMuted: true,
                            ),
                            MySpacing.height(2),
                            MyText.bodySmall(
                              '${doctor.ratings} out of 5',
                              color: theme.colorScheme.onBackground,
                              fontWeight: 700,
                            ),
                          ],
                        ),
                      ],
                    ),
                    MySpacing.height(8),
                    Row(
                      children: [
                        MyContainer(
                          paddingAll: 8,
                          child: Icon(
                            Icons.group,
                            color: CustomTheme.blue,
                          ),
                        ),
                        MySpacing.width(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.bodySmall(
                              'Patients',
                              color: theme.colorScheme.onBackground,
                              xMuted: true,
                            ),
                            MySpacing.height(2),
                            MyText.bodySmall(
                              '${doctor.patients}+',
                              color: theme.colorScheme.onBackground,
                              fontWeight: 700,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          MySpacing.height(32),
          MyContainer(
            paddingAll: 24,
            borderRadiusAll: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyLarge(
                  'Biography',
                  fontWeight: 600,
                ),
                MySpacing.height(16),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: doctor.biography,
                        style: MyTextStyle.bodySmall(
                          color: theme.colorScheme.onBackground,
                          xMuted: true,
                          height: 1.5,
                        )),
                    TextSpan(
                      text: " Read more",
                      style: MyTextStyle.bodySmall(
                        color: CustomTheme.blue,
                      ),
                    ),
                  ]),
                ),
                MySpacing.height(24),
                MyText.bodyLarge(
                  'Location',
                  fontWeight: 600,
                ),
                MySpacing.height(16),
                MyContainer(
                  paddingAll: 0,
                  borderRadiusAll: 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Image(
                      fit: BoxFit.cover,
                      height: 140,
                      width: MediaQuery.of(context).size.width - 96,
                      image: AssetImage('assets/other/map-md-snap.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MySpacing.height(32),
          MyButton.block(
            elevation: 0,
            borderRadiusAll: 8,
            padding: MySpacing.y(20),
            backgroundColor: AppTheme.customTheme.medicarePrimary,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  builder: (context) => MediCareAppointmentScreen()));
            },
            child: MyText.bodyLarge(
              'Make Appointment',
              color: AppTheme.customTheme.medicareOnPrimary,
              fontWeight: 600,
            ),
          ),
        ],
      ),
    );
  }
}
