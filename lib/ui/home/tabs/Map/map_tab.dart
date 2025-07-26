import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_styles.dart';
import '../../../../widget/custom_elevated_bottom.dart';
import '../../../../widget/custom_text_field.dart';
class MapTab extends StatefulWidget {

   MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  TextEditingController emailController = TextEditingController(text: 'hassan@gmail.com') ;

  TextEditingController passwordController = TextEditingController(text: '123456') ;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end ,
            children: [
              TextButton(
                  onPressed: (){
                    //todo : Navigate to Forget Passworld Screen
                  },
                  child: Text(
                    AppLocalizations.of(context)!.forgetPassword_title,
                    style: AppStyles.bold16Primary.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary
                    ),
                  )
              ),
            ],
          ),
          SizedBox(height: height*0.028,),
          CustomElevatedBottom(
              onPressed: (){
              },
              text: AppLocalizations.of(context)!.register_login
          ),
          SizedBox(height: height*0.028,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.login_account,
                style: AppStyles.midum16Black,
              ) ,
              TextButton(
                onPressed: (){
                  //todo : navigate to register screen
                  Navigator.of(context).pushNamed(AppRoutes.registerScreen);
                },
                child: Text(
                  AppLocalizations.of(context)!.register_button,
                  style: AppStyles.bold16Primary.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: height*0.028,),
          Row(
            children: [
              Expanded(
                child: Divider(
                  indent: width*0.05,
                  endIndent: width*0.05,
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
                  indent: width*0.05,
                  endIndent: width*0.05,
                  thickness: 2,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: height*0.028,),
          CustomElevatedBottom(
              backGroundColor: AppColors.transparent,
              onPressed: (){},
              text: AppLocalizations.of(context)!.login_google
          ),
        ],
      ),

    );
  }
}
