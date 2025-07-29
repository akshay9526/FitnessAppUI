import 'package:fitness/utils/appColors.dart';
import 'package:flutter/material.dart';

class HeightInputWidget extends StatefulWidget {
  final VoidCallback? onContinue;

  const HeightInputWidget({super.key, this.onContinue});

  @override
  State<HeightInputWidget> createState() => _HeightInputWidgetState();
}

class _HeightInputWidgetState extends State<HeightInputWidget> {
  final List<String> feetList = List.generate(8, (index) => '${index + 1}′');
  final List<String> inchList = List.generate(12, (index) => '${index}″');
  final List<String> unitList = ['ft/in'];

  late String selectedFeet;
  late String selectedInch;
  late String selectedUnit;

  @override
  void initState() {
    super.initState();
    selectedFeet = feetList[4];
    selectedInch = inchList[5];
    selectedUnit = unitList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How tall are you?",
          style: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDropdown(feetList, selectedFeet, (value) {
              setState(() {
                selectedFeet = value!;
              });
            }),
            const SizedBox(width: 10),
            buildDropdown(inchList, selectedInch, (value) {
              setState(() {
                selectedInch = value!;
              });
            }),
            const SizedBox(width: 10),
            buildDropdown(unitList, selectedUnit, (value) {
              setState(() {
                selectedUnit = value!;
              });
            }),
          ],
        ),
      ],
    );
  }

  Widget buildDropdown(
    List<String> items,
    String selected,
    ValueChanged<String?> onChanged,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
