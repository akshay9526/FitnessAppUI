import 'dart:async';

import 'package:fitness/screens/selectlanguage_screen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/appColors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

  int _start = 10;
  Timer? _timer;

  void verifyOtp() {
    final otp = otpController.text;
    if (otp.length == 4) {
      if (otp.contains('1234')) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SelectLanguage()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a 6-digit OTP")),
      );
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start <= 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String get _formattedTime {
    final minutes = (_start ~/ 60).toString().padLeft(1, '0');
    final seconds = (_start % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

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
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                AppStrings.enter_otp,
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
              PinCodeTextField(
                appContext: context,
                controller: otpController,
                length: 4,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 60,
                  fieldWidth: 60,
                  activeFillColor: AppColors.bg_Bottom_Gradient,
                  selectedFillColor: AppColors.bg_Bottom_Gradient,
                  inactiveFillColor: AppColors.bg_Bottom_Gradient,
                  activeColor: Colors.grey.shade300,
                  selectedColor: Colors.blueGrey.shade100,
                  inactiveColor: Colors.grey.shade100,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (_) => verifyOtp(),
                onChanged: (_) {},
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _start > 0
                    ? Text(
                        _formattedTime,
                        style: TextStyle(
                          color: AppColors.primary.withOpacity(.8),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            _start = 119;
                          });
                          _startTimer();
                        },
                        child: Text(
                          AppStrings.resend_otp,
                          style: TextStyle(
                            color: AppColors.primary.withOpacity(.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
