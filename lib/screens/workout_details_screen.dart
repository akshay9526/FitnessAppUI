import 'package:fitness/screens/workoutstartscreen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../utils/appColors.dart';
import '../widgets/InfoCard.dart';
import '../widgets/buildButtonWidget.dart';
import '../widgets/feature_card_meditation.dart';

class WorkoutDetailsScreen extends StatefulWidget {
  const WorkoutDetailsScreen({super.key});

  @override
  State<WorkoutDetailsScreen> createState() => _WorkoutDetailsScreenState();
}

class _WorkoutDetailsScreenState extends State<WorkoutDetailsScreen> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'fIQmHL_EXHQ',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bg_Bottom_Gradient.withOpacity(.6),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                'Workout',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              )
            ],
          ),
        ),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: AppColors.primary,
                  progressColors: ProgressBarColors(
                    playedColor: AppColors.primary,
                    handleColor: AppColors.primary,
                  ),
                  onReady: () {},
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Yoga body streching',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Relax',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const InfoCard(
                    time: '10 Mins', type: 'Beginner', serving: '9 Workout'),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Workout activities',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    children: [
                      FeatureCardMeditation(
                        iconPath: 'assets/images/yoga.jpg',
                        title: 'Yoga Warm-up',
                        subtitle: '10 Minutes',
                        colorCode: AppColors.card3.withOpacity(.2),
                      ),
                      FeatureCardMeditation(
                        iconPath: 'assets/images/situp.jpg',
                        title: 'Sit Up',
                        subtitle: '20 Minutes',
                        colorCode: AppColors.primary.withOpacity(.2),
                      ),
                      FeatureCardMeditation(
                        iconPath: 'assets/images/pushup.jpg',
                        title: 'Push Up',
                        subtitle: '15 Minutes',
                        colorCode: AppColors.card2.withOpacity(.2),
                      ),
                      FeatureCardMeditation(
                        iconPath: 'assets/images/pushup.jpg',
                        title: 'Chrrful Mood',
                        subtitle: '15 Minutes',
                        colorCode: AppColors.primary.withOpacity(.2),
                      ),
                      FeatureCardMeditation(
                        iconPath: 'assets/images/pushup.jpg',
                        title: 'Chrrful Mood',
                        subtitle: '15 Minutes',
                        colorCode: AppColors.card3.withOpacity(.2),
                      ),
                      FeatureCardMeditation(
                        iconPath: 'assets/images/pushup.jpg',
                        title: 'One Leg Downward',
                        subtitle: '15 Minutes',
                        colorCode: AppColors.card1.withOpacity(.2),
                      ),
                      FeatureCardMeditation(
                        iconPath: 'assets/images/pushup.jpg',
                        title: 'Wheel pose',
                        subtitle: '15 Minutes',
                        colorCode: AppColors.card2.withOpacity(.2),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: buildButtonWidget(
                      buttonColor: AppColors.primary,
                      textColor: AppColors.bg_Top_Gradient,
                      context: context,
                      label: AppStrings.start,
                      fontSize: 16,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Workoutstartscreen()),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
