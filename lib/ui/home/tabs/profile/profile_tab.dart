import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/ui/home/tabs/profile/details/language_bottom_sheet.dart';
import 'package:evently/ui/home/tabs/profile/details/theme_bottom_sheet.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/language_provider.dart';


class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(AppAssets.profileImage),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: width*0.04
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.accountName,
                    style: AppStyles.bold20White,
                  ),
                  Text(
                    AppLocalizations.of(context)!.accountemail,
                    style: AppStyles.midum16White,
                  )
                ],
              ),
            )
          ],
        ),
        backgroundColor: AppColors.primary,
        toolbarHeight: height*0.2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(64)
          )
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width*0.04,
          vertical: height*0.04
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.profile_language,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: height*0.02
              ),
              padding: EdgeInsets.symmetric(
                horizontal: width *0.02,
                vertical : height *0.01
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary,
                  width: 2
                )
              ),
              child: InkWell(
                onTap: (){
                  showModalButtomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        languageProvider.appLanguage == 'en' ?
                         AppLocalizations.of(context)!.profile_english :
                         AppLocalizations.of(context)!.profile_arabic,
                        style: AppStyles.bold20Primary ,
                    ),
                    Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 35,
                      color: AppColors.primary,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Text(
              AppLocalizations.of(context)!.profile_theme,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: height*0.02
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: width *0.02,
                  vertical : height *0.01
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: AppColors.primary,
                      width: 2
                  )
              ),
              child: InkWell(
                onTap: (){
                  showThemeButtomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.appTheme == ThemeMode.light?
                          AppLocalizations.of(context)!.profile_light:
                          AppLocalizations.of(context)!.profile_dark,
                      style: AppStyles.bold20Primary ,
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 35,
                      color: AppColors.primary,
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: height*0.02,
                  horizontal: width *0.04
                ),
                backgroundColor: AppColors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
                onPressed: (){
                  //todo : logout
                },
                child: Row(
                  children: [
                    Icon(
                        Icons.login_outlined,
                        color: AppColors.white,
                    ),
                    SizedBox(width: width*0.02,),
                    Text(
                      AppLocalizations.of(context)!.profile_logout,
                      style: AppStyles.bold20White,
                    )
                  ],
                )
            )
          ],
        ),
      ),

    );
  }

  void showModalButtomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeButtomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
