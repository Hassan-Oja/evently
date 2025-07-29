import 'package:evently/l10n/app_localizations_ar.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:evently/widget/custom_elevated_bottom.dart';
import 'package:evently/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/theme_provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(
    text: 'hassan@gmail.com',
  );

  TextEditingController passwordController = TextEditingController(
    text: '123456',
  );

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.056,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.logo, height: height * 0.2),
                SizedBox(height: height * 0.028),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Email";
                          }
                          final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          ).hasMatch(emailController.text);
                          if (!emailValid) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                        controller: emailController,
                        keyBoardType: TextInputType.emailAddress,
                        prefixIcon: Image.asset(AppAssets.emailIcon),
                        labelText: AppLocalizations.of(context)!.login_email,
                        labelStyle: AppStyles.midum16gray,
                      ),
                      SizedBox(height: height * 0.028),
                      CustomTextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter password";
                          }
                          if (passwordController.text.length < 6) {
                            return 'Password Should be at Least 6 Charachters';
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        prefixIcon: Image.asset(AppAssets.passwordIcon),
                        suffixIcon: Image.asset(AppAssets.hiddenIcon),
                        labelText: AppLocalizations.of(context)!.login_password,
                        labelStyle: AppStyles.midum16gray,
                      ),
                      SizedBox(height: height * 0.028),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              //todo : Navigate to Forget Passworld Screen
                            },
                            child: Text(
                              AppLocalizations.of(
                                context,
                              )!.forgetPassword_title,
                              style: AppStyles.bold16Primary.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.028),
                      CustomElevatedBottom(
                        onPressed: () {
                          login();
                        },
                        text: AppLocalizations.of(context)!.register_login,
                      ),
                      SizedBox(height: height * 0.028),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.login_account,
                            style: themeProvider.appTheme == ThemeMode.dark?
                            AppStyles.midum16White : AppStyles.midum16Black,
                          ),
                          TextButton(
                            onPressed: () {
                              //todo : navigate to register screen
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.registerScreen);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.register_button,
                              style: AppStyles.bold16Primary.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.028),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              indent: width * 0.05,
                              endIndent: width * 0.05,
                              thickness: 2,
                              color: AppColors.primary,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.login_or,
                            style: AppStyles.midum16primary,
                          ),
                          Expanded(
                            child: Divider(
                              indent: width * 0.05,
                              endIndent: width * 0.05,
                              thickness: 2,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.028),
                      CustomElevatedBottom(
                        hasIcon: true,
                        iconName: Image.asset(AppAssets.googleIcon),
                        textStyle: AppStyles.midum20primary,
                        backGroundColor: AppColors.transparent,
                        borderColor: AppColors.primary,
                        onPressed: () {},
                        text: AppLocalizations.of(context)!.login_google,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == true) {
      Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
    }
  }
}
