import 'package:evently/l10n/app_localizations_ar.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:evently/widget/custom_elevated_bottom.dart';
import 'package:evently/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';


class RegisterScreen extends StatefulWidget {

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController(text: 'Hassan') ;

  TextEditingController emailController = TextEditingController(text: 'hassan@gmail.com') ;

  TextEditingController passwordController = TextEditingController(text: '123456') ;

  TextEditingController rePasswordController = TextEditingController(text: '123456') ;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
       backgroundColor: AppColors.white,
        title: Text(
          AppLocalizations.of(context)!.register_Title,
          style: AppStyles.bold16Black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width*0.04,
          vertical: height*0.056
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo , height: height*0.2,),
              SizedBox(height: height*0.028,),
              Form(
                key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    validator: (text) {
                      if(text == null || text.isEmpty){
                        return "Please Enter Name";
                      }
                      return null ;
                    },
                    controller: nameController,
                    prefixIcon: Image.asset(AppAssets.nameIcon),
                    labelText: AppLocalizations.of(context)!.register_name,
                    labelStyle: AppStyles.midum16gray,
                  ) ,
                  SizedBox(height: height*0.028,),
                  CustomTextFormField(
                    validator: (text) {
                      if(text == null || text.isEmpty){
                        return "Please Enter Email";
                      }
                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(emailController.text);
                      if(!emailValid){
                        return 'Please Enter Valid Email';
                      }
                      return null ;
                    },
                    controller: emailController,
                    keyBoardType: TextInputType.emailAddress,
                    prefixIcon: Image.asset(AppAssets.emailIcon),
                    labelText: AppLocalizations.of(context)!.login_email,
                    labelStyle: AppStyles.midum16gray,
                  ) ,
                  SizedBox(height: height*0.028,),
                  CustomTextFormField(
                    validator: (text) {
                      if(text == null || text.isEmpty){
                        return "Please Enter password";
                      }
                      if(passwordController.text.length < 6){
                        return 'Password Should be at Least 6 Charachters';
                      }
                      return null ;
                    },
                    controller: passwordController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    prefixIcon: Image.asset(AppAssets.passwordIcon),
                    suffixIcon: Image.asset(AppAssets.hiddenIcon),
                    labelText: AppLocalizations.of(context)!.login_password,
                    labelStyle: AppStyles.midum16gray,
                  ),
                  SizedBox(height: height*0.028,),
                  CustomTextFormField(
                    validator: (text) {
                      if(text == null || text.isEmpty){
                        return "Please Enter password";
                      }
                      if(passwordController.text != rePasswordController.text){
                        return "Password Doesn't Match " ;
                      }
                      return null ;
                    },
                    controller: rePasswordController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    prefixIcon: Image.asset(AppAssets.passwordIcon),
                    suffixIcon: Image.asset(AppAssets.hiddenIcon),
                    labelText: AppLocalizations.of(context)!.register_rePassword,
                    labelStyle: AppStyles.midum16gray,
                  ),
                  SizedBox(height: height*0.028,),
                  CustomElevatedBottom(
                      onPressed: (){
                        register();
                      },
                      text: AppLocalizations.of(context)!.login_create
                  ),
                  SizedBox(height: height*0.028,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.register_have}?',
                        style: AppStyles.midum16Black,
                      ) ,
                      TextButton(
                        onPressed: (){
                          //todo : navigate to login screen
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          AppLocalizations.of(context)!.register_login,
                          style: AppStyles.bold16Primary.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primary
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height*0.028,),

                ],
              )
              )
            ],
          ),
        ),
      ),

    );
  }

  void register() {
    if(formKey.currentState?.validate()==true){
      Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
    }
  }
}
