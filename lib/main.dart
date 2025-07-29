import 'package:device_preview/device_preview.dart';
import 'package:fitness/screens/login_screen.dart';
import 'package:fitness/screens/splashscreen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Loginbloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: AppStrings.Fitness,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}