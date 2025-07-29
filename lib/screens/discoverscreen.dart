import 'package:fitness/model/recipe.dart';
import 'package:fitness/screens/food_recipesscreen.dart';
import 'package:fitness/screens/meditation_screen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:fitness/widgets/feature_card4.dart';
import 'package:fitness/widgets/receipeCards.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import '../widgets/feature_card_meditation.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  List<Recipe> recipes = [
    Recipe(
      recImage: 'assets/images/chk_avcad_sandwich.jpg',
      recName: 'Chicken Avacado Sandwich',
      recTime: '5 min',
    ),
    Recipe(
      recImage: 'assets/images/papad_salad.png',
      recName: 'Papad And Salad',
      recTime: '10 min',
    ),
    Recipe(
      recImage: 'assets/images/energybar.jpg',
      recName: 'Energy Bar',
      recTime: '10 min',
    ),
    Recipe(
      recImage: 'assets/images/fruit_smoothie.jpg',
      recName: 'Fruit Smoothie',
      recTime: '10 min',
    ),
  ];

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
                      hintText: AppStrings.search,
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
                      AppStrings.Discover,
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(8),
                      child: TabBar(
                        labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        indicator: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        indicatorWeight: 0,
                        indicatorColor: AppColors.primary,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: AppColors.bg_Top_Gradient,
                        unselectedLabelColor: AppColors.black.withOpacity(.6),
                        tabs: [
                          Tab(
                            child: SizedBox(
                              height: 40,
                              child: Center(child: Text(AppStrings.Beginner)),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              height: 40,
                              child: Center(child: Text(AppStrings.Intermediate)),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              height: 40,
                              child: Center(child: Text(AppStrings.Advanced)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: TabBarView(
                        children: [
                          ListView(
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            children: [
                              FeatureCard4(
                                iconPath:
                                    'assets/images/streching_remove_disc.png',
                                title: 'Full body streching',
                                subtitle: '19 Minutes',
                                colorCode: AppColors.card3.withOpacity(.2),
                                width: 200,
                                height: 180,
                              ),
                              FeatureCard4(
                                iconPath:
                                    'assets/images/militarypress_remove_disc.png',
                                title: 'Military Press',
                                subtitle: '14 Minutes',
                                colorCode: AppColors.card2.withOpacity(.2),
                                width: 160,
                                height: 200,
                              ),
                              FeatureCard4(
                                iconPath:
                                    'assets/images/abdominal_remove_disc.png',
                                title: 'Abdominal Exercise',
                                subtitle: '14 Minutes',
                                colorCode: AppColors.primary.withOpacity(.2),
                                width: 180,
                                height: 180,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              AppStrings.Meditation,
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const MeditationScreen()));
                            },
                            child: Text(
                              AppStrings.see_all,
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.40,
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
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const FoodRecipeScreen()));
                              },
                              child: Text(
                                AppStrings.Food_recipes,
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const FoodRecipeScreen()));
                            },
                            child: Text(
                              AppStrings.see_all,
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: recipes.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 18,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.75),
                        itemBuilder: (context, index) {
                          return RecipeCard(
                              recImage: recipes[index].recImage,
                              recName: recipes[index].recName,
                              recTime: recipes[index].recTime);
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
