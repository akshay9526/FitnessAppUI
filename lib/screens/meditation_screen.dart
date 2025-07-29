import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import '../widgets/FilterBottomSheet.dart';
import '../widgets/feature_card_meditation.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  final List<String> type = [
    'Calm',
    'Sleep',
    'Relax',
    'Focus',
    'Happiness',
  ];

  String? selectedtype = 'Calm';

  final List<String> durations = [
    '2-4 minutes',
    '4-20 minutes',
    'Over 20 minutes',
  ];

  String? selectedDurations = '2-4 minutes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bg_Bottom_Gradient.withOpacity(.6),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: isSearching
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle:
                          TextStyle(color: AppColors.black.withOpacity(0.5)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      AppStrings.Meditation,
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
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) _searchController.clear();
              });
            },
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
                isSearching ? Icons.close : Icons.search,
                color: AppColors.black,
                size: 22,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) {
                  return FilterBottomSheet(
                    type: type,
                    selectedType: selectedtype,
                    onTypeSelected: (value) {
                      setState(() {
                        selectedtype = value;
                      });
                    },
                    durations: durations,
                    selectedDuration: selectedDurations,
                    onDurationSelected: (value) {
                      setState(() {
                        selectedDurations = value;
                      });
                    },
                    onCancel: () {
                      Navigator.pop(context);
                    },
                    onApply: () {
                      // apply logic
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
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
              child: Image.asset('assets/icons/filter.png'),
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.50,
          width: MediaQuery.of(context).size.width,
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
      ),
    );
  }
}
