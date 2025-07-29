import 'package:fitness/utils/appColors.dart';
import 'package:flutter/cupertino.dart';

class InlineTimePicker extends StatefulWidget {
  const InlineTimePicker({Key? key}) : super(key: key);

  @override
  State<InlineTimePicker> createState() => _InlineTimePickerState();
}

class _InlineTimePickerState extends State<InlineTimePicker> {
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.bg_Bottom_Gradient.withOpacity(.8),
          height: 250,
          child: CupertinoTheme(
            data: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              initialDateTime: _selectedTime,
              use24hFormat: false,
              onDateTimeChanged: (DateTime newTime) {
                setState(() {
                  _selectedTime = newTime;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
