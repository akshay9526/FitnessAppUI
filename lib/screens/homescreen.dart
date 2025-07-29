import 'package:fitness/screens/food_recipesscreen.dart';
import 'package:fitness/screens/meditation_screen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import '../widgets/feature_card.dart';
import '../widgets/feature_card2.dart';
import '../widgets/feature_card3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/user.jpg'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, User',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    'Tuesday, 8 July',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
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
                  color: AppColors.bg_Bottom_Gradient, // Outline color
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.notifications_sharp,
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    children: [
                      FeatureCard(
                        onTap: () {},
                        iconPath: 'assets/icons/dumble.png',
                        title: 'Workout',
                        subtitle: '500+ Workout',
                        colorCode: AppColors.bg_Bottom_Gradient.withOpacity(.6),
                      ),
                      FeatureCard(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MeditationScreen()));
                        },
                        iconPath: 'assets/icons/meditation.png',
                        title: 'Meditation',
                        subtitle: '1000+ Meditation',
                        colorCode: AppColors.card2.withOpacity(.2),
                      ),
                      FeatureCard(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const FoodRecipeScreen()));
                        },
                        iconPath: 'assets/icons/food.png',
                        title: 'Food',
                        subtitle: '200+ Recipe',
                        colorCode: AppColors.card3.withOpacity(.2),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppStrings.today_plan,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    children: [
                      FeatureCard2(
                        iconPath: 'assets/images/yoga.jpg',
                        title: 'Yoga Warm-up',
                        subtitle: '10 Minutes',
                        colorCode: AppColors.card3.withOpacity(.2),
                      ),
                      FeatureCard2(
                        iconPath: 'assets/images/situp.jpg',
                        title: 'Sit Up',
                        subtitle: '20 Minutes',
                        colorCode: AppColors.card2.withOpacity(.2),
                      ),
                      FeatureCard2(
                        iconPath: 'assets/images/pushup.jpg',
                        title: 'Push Up',
                        subtitle: '15 Minutes',
                        colorCode: AppColors.card1.withOpacity(.2),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppStrings.Recommended_workouts,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    children: [
                      FeatureCard3(
                        iconPath: 'assets/images/streching.png',
                        title: 'Full body streching',
                        subtitle: '19 Minutes',
                        colorCode: AppColors.card2.withOpacity(.2),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FeatureCard3(
                        iconPath: 'assets/images/yoga.png',
                        title: 'Yoga',
                        subtitle: '40 Minutes',
                        colorCode: AppColors.card3.withOpacity(.2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
