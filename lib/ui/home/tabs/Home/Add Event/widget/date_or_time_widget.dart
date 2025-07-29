import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../providers/theme_provider.dart';
import '../../../../../../utils/app_colors.dart';

class DateOrTimeWidget extends StatelessWidget {
  String iconName;
  String eventDateOrTime;
  String chooseDateOrTime;
  VoidCallback onChooseDateOrTime ;

   DateOrTimeWidget({
     super.key,
     required this.iconName,
     required this.eventDateOrTime,
     required this.chooseDateOrTime,
     required this.onChooseDateOrTime
   });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Row(
      children: [
        Image.asset(
            iconName,
          color: themeProvider.appTheme == ThemeMode.dark ?
          AppColors.white : AppColors.black,
        ),
        SizedBox(width: width*0.025,),
        Text(
          eventDateOrTime,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Spacer(),
        TextButton(
            onPressed: () {
              onChooseDateOrTime();
            },
            child: Text(
              chooseDateOrTime,
              style: AppStyles.midum16primary,
            )
        )
      ],
    );
  }
}
