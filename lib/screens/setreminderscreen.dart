import 'package:fitness/widgets/buildButtonWidget2.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import '../widgets/InlineTimePicker.dart';
import '../widgets/buildButtonWidget.dart';
import '../widgets/setremindercard.dart';

class Setreminderscreen extends StatefulWidget {
  const Setreminderscreen({super.key});

  @override
  State<Setreminderscreen> createState() => _SetreminderscreenState();
}

class _SetreminderscreenState extends State<Setreminderscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bg_Bottom_Gradient.withOpacity(.6),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                'Set a reminder',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              )
            ],
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
        child: Column(
          children: [
            const InlineTimePicker(),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  Setremindercard(
                      icon: Icons.repeat,
                      title: "Repeat",
                      subtitle: "Every day"),
                  Setremindercard(
                      icon: Icons.notifications_sharp,
                      title: "Notification Sound",
                      subtitle: "Default Ringtone"),
                  Setremindercard(
                      icon: Icons.vibration,
                      title: "Vibrate",
                      subtitle: "Every day"),
                  Setremindercard(
                      icon: Icons.label_important,
                      title: "Label",
                      subtitle: "Every day"),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: buildButtonWidget2(
                        context: context,
                        label: 'Continue',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        fontSize: 16,
                        textColor: AppColors.primary,
                        buttonColor: Colors.white,
                        borderColor: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: buildButtonWidget(
                        buttonColor: AppColors.primary,
                        textColor: AppColors.bg_Top_Gradient,
                        context: context,
                        label: 'Apply',
                        fontSize: 16,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
