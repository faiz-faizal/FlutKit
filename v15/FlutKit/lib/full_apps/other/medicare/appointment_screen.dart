import 'package:flutkit/full_apps/other/medicare/models/date_time.dart';
import 'package:flutkit/full_apps/other/medicare/models/slot.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class MediCareAppointmentScreen extends StatefulWidget {
  @override
  _MediCareAppointmentScreenState createState() =>
      _MediCareAppointmentScreenState();
}

class _MediCareAppointmentScreenState extends State<MediCareAppointmentScreen> {
  late int selectedDate = 0;
  late int selectedSlot = 0;

  late List<DateTime> data;
  late List<String> morningSlots;
  late List<String> afternoonSlots;
  late List<String> eveningSlots;

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    data = DateTime.dummyList();
    morningSlots = Slot.morningList();
    afternoonSlots = Slot.afternoonList();
    eveningSlots = Slot.eveningList();
  }

  List<Widget> _buildDateList() {
    List<Widget> list = [];
    for (int i = 0; i < data.length; i++) {
      list.add(
          _buildSingleDate(date: data[i].date, day: data[i].day, index: i));
    }
    return list;
  }

  List<Widget> _buildMorningSlotList() {
    List<Widget> list = [];
    for (int i = 0; i < morningSlots.length; i++) {
      list.add(_buildSingleSlot(time: morningSlots[i], index: i));
    }
    return list;
  }

  List<Widget> _buildAfternoonSlotList() {
    List<Widget> list = [];
    for (int i = 0; i < afternoonSlots.length; i++) {
      list.add(_buildSingleSlot(
          time: afternoonSlots[i], index: i + morningSlots.length));
    }
    return list;
  }

  List<Widget> _buildEveningSlotList() {
    List<Widget> list = [];
    for (int i = 0; i < eveningSlots.length; i++) {
      list.add(_buildSingleSlot(
          time: eveningSlots[i],
          index: i + morningSlots.length + afternoonSlots.length));
    }
    return list;
  }

  Widget _buildSingleSlot({String? time, int? index}) {
    return InkWell(
        onTap: () {
          setState(() {
            selectedSlot = index!;
          });
        },
        child: MyContainer(
          color: selectedSlot == index
              ? customTheme.medicarePrimary
              : customTheme.card,
          padding: MySpacing.symmetric(vertical: 8, horizontal: 16),
          borderRadiusAll: 4,
          child: MyText.bodySmall(time!,
              color: selectedSlot == index
                  ? customTheme.medicareOnPrimary
                  : theme.colorScheme.onBackground),
        ));
  }

  Widget _buildSingleDate({String? date, String? day, int? index}) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedDate = index!;
        });
      },
      child: MyContainer(
        paddingAll: 12,
        color: selectedDate == index
            ? customTheme.medicarePrimary
            : Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyText.bodySmall(
              day!,
              color: selectedDate == index
                  ? customTheme.medicareOnPrimary
                  : theme.colorScheme.onBackground,
              fontWeight: 800,
            ),
            MySpacing.height(12),
            MyText.bodySmall(
              date!,
              color: selectedDate == index
                  ? customTheme.medicareOnPrimary
                  : theme.colorScheme.onBackground,
              fontWeight: 700,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customTheme.card,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            )),
        elevation: 0,
        title: MyText.bodyLarge('Appointment', fontWeight: 700),
      ),
      body: Container(
        color: customTheme.card,
        child: Column(
          children: [
            Container(
              padding: MySpacing.nRight(16),
              color: customTheme.card,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _buildDateList(),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: MySpacing.all(24),
                children: [
                  MyText('Morning Slots', fontWeight: 800),
                  MySpacing.height(8),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: _buildMorningSlotList(),
                  ),
                  MySpacing.height(32),
                  MyText('Afternoon Slots', fontWeight: 80),
                  MySpacing.height(8),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: _buildAfternoonSlotList(),
                  ),
                  MySpacing.height(32),
                  MyText('Evening Slots', fontWeight: 800),
                  MySpacing.height(8),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: _buildEveningSlotList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: MySpacing.all(24),
              child: MyButton.block(
                borderRadiusAll: 8,
                elevation: 0,
                onPressed: () {},
                backgroundColor: customTheme.medicarePrimary,
                child: MyText("Confirm Appointment",
                    fontWeight: 700, color: customTheme.medicareOnPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
