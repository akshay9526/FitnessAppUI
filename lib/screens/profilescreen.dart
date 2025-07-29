import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:fitness/screens/workout_reminderscreen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:fitness/widgets/InfoCard2.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                AppStrings.profile,
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
                Icons.login_outlined,
                color: AppColors.black,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.bg_Bottom_Gradient.withOpacity(.6),
                      width: 4.0,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/userpic.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "User",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "example@gmail.com",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  color: AppColors.primary.withOpacity(.9),
                  clipBehavior: Clip.antiAlias,
                  elevation: 0.8,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(
                      width: 0.2,
                      color: AppColors.bg_Bottom_Gradient,
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upgrade to premium",
                                style: TextStyle(
                                  color: AppColors.bg_Bottom_Gradient,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Enjoy workout without ads and restrictions",
                                style: TextStyle(
                                  color: AppColors.bg_Bottom_Gradient,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.primary,
                              size: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const InfoCard2(
                  weight: "55kg",
                  height: "5/5 ft/in",
                  age: "45 Yrs",
                ),
                const SizedBox(height: 10),
                SettingsGroup(
                  backgroundColor: AppColors.primary.withOpacity(.1),
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.history,
                      iconStyle: IconStyle(
                          iconsColor: AppColors.primary, withBackground: false),
                      title: "History",
                      titleStyle: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SettingsItem(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const WorkoutReminderscreen()));
                      },
                      icons: Icons.timer_outlined,
                      iconStyle: IconStyle(
                          iconsColor: AppColors.primary, withBackground: false),
                      title: "Workout Reminders",
                      titleStyle: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.edit_outlined,
                      iconStyle: IconStyle(
                          iconsColor: AppColors.primary, withBackground: false),
                      title: "Edit Profile",
                      titleStyle: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.language,
                      iconStyle: IconStyle(
                          iconsColor: AppColors.primary, withBackground: false),
                      title: "Language",
                      titleStyle: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
