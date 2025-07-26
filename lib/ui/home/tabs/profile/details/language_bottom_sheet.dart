import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_styles.dart';
class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height*0.04,
        horizontal: width*0.04
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              //todo: change language to english
              languageProvider.changeLanguage('en');
            },
            child: languageProvider.appLanguage == 'en' ?
             selectedLanguage(textLanguage: AppLocalizations.of(context)!.profile_english):
              unSelectedLanguage(textLanguage: AppLocalizations.of(context)!.profile_english),
          ),
          SizedBox(height: height*0.02,),
          InkWell(
            onTap: (){
              //todo: change language to arabic
              languageProvider.changeLanguage('ar');
            },
            child:languageProvider.appLanguage == 'ar' ?
             selectedLanguage(textLanguage: AppLocalizations.of(context)!.profile_arabic):
             unSelectedLanguage(textLanguage: AppLocalizations.of(context)!.profile_arabic),
          )
        ],
      ),
    );
  }

  Widget selectedLanguage( {required String textLanguage}){
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
          textLanguage,
          style: AppStyles.bold20Primary,
        ),
        Icon(Icons.check , color: AppColors.primary,)
      ],
    ),
  );
  }
  Widget unSelectedLanguage( {required String textLanguage}){
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
          textLanguage,
          style: AppStyles.bold20Black,
        ),
      ],
    ),
  );
  }
}
