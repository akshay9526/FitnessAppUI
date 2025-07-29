import 'package:fitness/Loginbloc/login_bloc.dart';
import 'package:fitness/screens/otp_screen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/appColors.dart';
import '../widgets/buildButtonWidget.dart';
import '../widgets/buildPasswordFormField.dart';
import '../widgets/custom_form_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
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
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.login,
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
                      CustomFormField(
                        icon:
                            Icon(Icons.mail, color: AppColors.black.withOpacity(.6)),
                        hintText: 'example@example.com',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._\-+]'))
                        ],
                        onChange: (val) => context.read<LoginBloc>().add(EmailChanged(val ?? '')),
                        validator: (_) =>
                        state.isEmailValid ? null : 'Invalid email',
                      ),
                      PasswordFormField(
                        hintText: AppStrings.password,
                        controller: passwordController,
                        fontSize: 16,
                        textColor: AppColors.black,
                        fillColor: Colors.white.withOpacity(0.8),
                        borderColor: AppColors.bg_Top_Gradient.withOpacity(.6),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$').hasMatch(val)) {
                            return 'Min 6 chars, 1 letter & 1 number';
                          }
                          return null;
                        },
                        onChanged: (val) => context.read<LoginBloc>().add(PasswordChanged(val)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          AppStrings.Forgot_Password,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black.withOpacity(.4),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      buildButtonWidget(
                        buttonColor: AppColors.primary,
                        textColor: AppColors.bg_Top_Gradient,
                        context: context,
                        label: AppStrings.login_in,
                        fontSize: 16,
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const OtpScreen()),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.donthave_account,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black.withOpacity(.4),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            AppStrings.Sign_Up,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
