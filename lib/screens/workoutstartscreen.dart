import 'package:fitness/screens/congratulationscreen.dart';
import 'package:fitness/widgets/CountdownTimerWidget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../utils/appColors.dart';
import '../widgets/buildButtonWidget.dart';

class Workoutstartscreen extends StatefulWidget {
  const Workoutstartscreen({super.key});

  @override
  State<Workoutstartscreen> createState() => _WorkoutstartscreenState();
}

class _WorkoutstartscreenState extends State<Workoutstartscreen> {
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
      backgroundColor: AppColors.bg_Bottom_Gradient,
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: buildButtonWidget(
                  buttonColor: AppColors.primary.withOpacity(.2),
                  textColor: AppColors.primary,
                  context: context,
                  label: 'Next',
                  fontSize: 16,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const Congratulationscreen()),
                    );
                  },
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
                  label: 'Previous',
                  fontSize: 16,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
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
                Center(
                  child: Text(
                    'Yoga body streching',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Yoga is a holistic practice that combines physical postures (asanas), breathing techniques (pranayama), and meditation to promote physical and mental well-being.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black,
                      height: 1.5, // For better line spacing
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: MediaQuery.of(context).size.width * 0.25,
                    child: Card(
                      color: AppColors.primary.withOpacity(.9),
                      clipBehavior: Clip.antiAlias,
                      elevation: 0.8,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                          width: 0.2,
                          color: AppColors.bg_Bottom_Gradient,
                        ),
                      ),
                      child: const CountdownTimerWidget(seconds: 10),
                    ),
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
