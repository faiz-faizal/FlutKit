import 'package:flutkit/full_apps/m3/learning/controllers/lecture_timetable_controller.dart';
import 'package:flutkit/helpers/extensions/extensions.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class LectureTimeTableScreen extends StatefulWidget {
  LectureTimeTableScreen({Key? key}) : super(key: key);

  @override
  _LectureTimeTableScreenState createState() => _LectureTimeTableScreenState();
}

class _LectureTimeTableScreenState extends State<LectureTimeTableScreen> {
  late ThemeData theme;
  late LectureTimeTableController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    controller = LectureTimeTableController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LectureTimeTableController>(
        init: controller,
        tag: 'lecture_time_table_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ).autoDirection(),
          ),
          title: MyText.titleMedium(
            'Time Table',
            fontWeight: 600,
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: MySpacing.nTop(16),
          child: SfCalendar(
            view: CalendarView.schedule,
            controller: controller.calendarController,
            showDatePickerButton: false,
            onViewChanged: controller.onViewChanged,
            dataSource: controller.events,
            minDate: controller.minDate,
            maxDate: controller.maxDate,
            monthViewSettings:
                MonthViewSettings(showAgenda: false, numberOfWeeksInView: 3),
            scheduleViewMonthHeaderBuilder:
                (BuildContext context, ScheduleViewMonthHeaderDetails details) {
              return MyContainer.none(
                margin: MySpacing.fromLTRB(0, 6, 0, 12),
                borderRadiusAll: 4,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  children: [
                    Image(
                        image: ExactAssetImage(
                            'assets/images/month_background/month_${details.date.month}.png'),
                        fit: BoxFit.cover,
                        width: details.bounds.width,
                        height: details.bounds.height),
                    Positioned(
                      left: 20,
                      right: 20,
                      top: 20,
                      bottom: 0,
                      child: Text(
                        '${details.date.monthName} ${details.date.year}',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              );
            },
            todayTextStyle:
                MyTextStyle.bodySmall(color: theme.colorScheme.onPrimary),
            todayHighlightColor: theme.colorScheme.primary,
            timeSlotViewSettings: TimeSlotViewSettings(
              minimumAppointmentDuration: Duration(minutes: 60),
            ),
          ),
        ),
      );
    }
  }
}
