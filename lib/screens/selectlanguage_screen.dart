import 'package:fitness/screens/genderscreen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import '../widgets/buildButtonWidget.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  final List<String> languages = [
    'English (US)',
    'Hindi',
    'French',
    'German',
    'Chinese',
  ];

  String? selectedLanguage = 'English (US)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bg_Top_Gradient,
        title: Text(
          '',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Language",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 50,
                child: Divider(
                  color: AppColors.primary,
                  thickness: 4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: languages.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 0.6,
                    thickness: 0.8,
                    color: AppColors.black.withOpacity(0.4),
                  ),
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    return RadioListTile<String>(
                      title: Text(language,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.black,
                            fontWeight: FontWeight.normal,
                          )),
                      value: language,
                      groupValue: selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value;
                        });
                      },
                      activeColor: AppColors.primary, // optional
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              buildButtonWidget(
                buttonColor: AppColors.primary,
                textColor: AppColors.bg_Top_Gradient,
                context: context,
                label: AppStrings.Continue,
                fontSize: 16,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const GenederScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
