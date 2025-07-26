import 'package:evently/l10n/app_localizations_ar.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:evently/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../Home/widget/event_item.dart';
class FavoriteTab extends StatelessWidget {
  TextEditingController searchController = TextEditingController() ;
  FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child:  Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width*0.04,
          vertical: height*0.04
        ),
        child: Column(
          children: [
            CustomTextFormField(
              controller: searchController,
              colorBorder: AppColors.primary,
              hintText: AppLocalizations.of(context)!.love_search,
              hintStyle: AppStyles.bold14Primary,
              prefixIcon: Image.asset(AppAssets.searchIcon),
            ),
            Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.only(
                        top: height*0.02
                    ),
                    itemBuilder: (context, index) {
                      return EventItem();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height*0.019,);
                    },
                    itemCount: 20
                )
            )
          ],
        ),
      ),
    );
  }
}
