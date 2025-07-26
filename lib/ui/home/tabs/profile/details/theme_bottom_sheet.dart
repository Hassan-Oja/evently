import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_styles.dart';
class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height*0.04,
          horizontal: width*0.04
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              //todo: change language to light
              themeProvider.changeTheme(ThemeMode.light);
            },
            child: themeProvider.appTheme == ThemeMode.light ?
            selectedtheme(textTheme: AppLocalizations.of(context)!.profile_light):
            unSelectedTheme(textTheme: AppLocalizations.of(context)!.profile_light),
          ),
          SizedBox(height: height*0.02,),
          InkWell(
            onTap: (){
              //todo: change language to dark
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.appTheme == ThemeMode.dark ?
            selectedtheme(textTheme: AppLocalizations.of(context)!.profile_dark):
            unSelectedTheme(textTheme: AppLocalizations.of(context)!.profile_dark),
          )
        ],
      ),
    );
  }

  Widget selectedtheme( {required String textTheme}){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: AppColors.primary,
              width: 2
          )
      ),
      padding: EdgeInsets.symmetric(
          horizontal: width *0.02,
          vertical : height *0.01
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textTheme,
            style: AppStyles.bold20Primary,
          ),
          Icon(Icons.check , color: AppColors.primary,)
        ],
      ),
    );
  }
  Widget unSelectedTheme( {required String textTheme}){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: AppColors.primary,
              width: 2
          )
      ),
      padding: EdgeInsets.symmetric(
          horizontal: width *0.02,
          vertical : height *0.01
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textTheme,
            style: AppStyles.bold20Black,
          ),
        ],
      ),
    );
  }
}
