import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import '../model/recipe.dart';
import '../widgets/receipeCards.dart';

class FoodRecipeScreen extends StatefulWidget {
  const FoodRecipeScreen({super.key});

  @override
  State<FoodRecipeScreen> createState() => _FoodRecipeScreenState();
}

class _FoodRecipeScreenState extends State<FoodRecipeScreen> {
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
    Recipe(
      recImage: 'assets/images/sports_drink.jpg',
      recName: 'Sports Drink',
      recTime: '10 min',
    ),
    Recipe(
      recImage: 'assets/images/Whole_grain_cereals_bread.jpg',
      recName: 'Whole Grain Cereals Bread',
      recTime: '10 min',
    ),
    Recipe(
      recImage: 'assets/images/Veggies_Hummus.jpg',
      recName: 'Veggies And Hummus',
      recTime: '10 min',
    ),
    Recipe(
      recImage: 'assets/images/Peanut_Butter.jpg',
      recName: 'Peanut Butter',
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
                      AppStrings.Food_recipes,
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
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recipes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
          ),
        ),
      ),
    );
  }
}
