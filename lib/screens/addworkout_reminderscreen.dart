import 'package:fitness/utils/appColors.dart';
import 'package:fitness/screens/setreminderscreen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';

import '../widgets/workout_reminderwidget.dart';

class AddworkoutReminderscreen extends StatefulWidget {
  const AddworkoutReminderscreen({super.key});

  @override
  State<AddworkoutReminderscreen> createState() =>
      _AddworkoutReminderscreenState();
}

class _AddworkoutReminderscreenState extends State<AddworkoutReminderscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bg_Bottom_Gradient.withOpacity(.6),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            AppStrings.workout_reminder,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.2),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.bg_Bottom_Gradient,
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.search,
                color: AppColors.black,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.bg_Top_Gradient,
              AppColors.bg_Bottom_Gradient,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              children: [
                WorkoutReminderwidget(title: "3:34", ampm: "AM", subtitle: "Daily, Every day", switchValue: true),
                WorkoutReminderwidget(title: "7:00", ampm: "PM", subtitle: "Daily, Every day", switchValue: false),
                WorkoutReminderwidget(title: "6:20", ampm: "AM", subtitle: "Daily, Every day", switchValue: false),
                WorkoutReminderwidget(title: "9:55", ampm: "AM", subtitle: "Today", switchValue: false),
                WorkoutReminderwidget(title: "1:04", ampm: "PM", subtitle: "Every day", switchValue: false),
                WorkoutReminderwidget(title: "6:20", ampm: "AM", subtitle: "Tomorrow", switchValue: false),
                const SizedBox(height: 80), // To leave space for the FAB
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Setreminderscreen(),
                    ),
                  );
                },
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.bg_Bottom_Gradient,
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppColors.bg_Bottom_Gradient,
                    size: 36,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
