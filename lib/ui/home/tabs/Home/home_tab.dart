import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/home/tabs/Home/widget/category_tab_item.dart';
import 'package:evently/ui/home/tabs/Home/widget/event_item.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex =0 ;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.category_all,
      AppLocalizations.of(context)!.category_sport,
      AppLocalizations.of(context)!.category_birthday,
      AppLocalizations.of(context)!.category_meeting,
      AppLocalizations.of(context)!.category_gaming,
      AppLocalizations.of(context)!.category_workshop,
      AppLocalizations.of(context)!.category_bookclub,
      AppLocalizations.of(context)!.category_exhibition,
      AppLocalizations.of(context)!.category_holiday,
      AppLocalizations.of(context)!.category_eating,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
         title: Row(
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                     AppLocalizations.of(context)!.home_welcome,
                   style: AppStyles.regular14White,
                 ),
                 Text(
                     'Route Academy',
                   style: AppStyles.bold24White,
                 )
               ],
             ),
             Spacer(),
             ImageIcon(AssetImage(AppAssets.themeIcon),color: AppColors.white,),
             SizedBox(width: width*0.02,),
             Container(
               padding: EdgeInsets.symmetric(
                 horizontal: width*0.02,
                 vertical: height*0.01
               ),
               margin: EdgeInsets.only(left: width*0.02),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8),
                 color: AppColors.white
               ),
               child: Text(
                 'EN',
                 style: AppStyles.bold14Primary,
               ),
             )
           ],
         ),
        bottom: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: height*0.09,
          title: Column(
            children: [
              Row(
                children: [
                  Image.asset(AppAssets.mapIcon , color: AppColors.white,),
                  SizedBox(width: width*0.02,),
                  Text(
                    'Cairo , Egypt',
                    style: AppStyles.midum14White,
                  )
                ],
              ),
              SizedBox(height: height*0.01,),
              DefaultTabController(
                  length: eventsNameList.length,
                  child: TabBar(
                    isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      labelPadding: EdgeInsets.zero,
                      indicatorColor: AppColors.transparent,
                      dividerColor: AppColors.transparent,
                      onTap: (index) {
                        selectedIndex = index ;
                        setState(() {

                        });
                      },
                      tabs: eventsNameList.map((eventName) {
                     return CategoryTabItem(
                         selectedTextStyle: Theme.of(context).textTheme.headlineMedium! ,
                         unSelectedTextStyle:  Theme.of(context).textTheme.headlineSmall!,
                       selectedBgColor: Theme.of(context).focusColor,
                         isSelected: selectedIndex == eventsNameList.indexOf(eventName),
                         eventName: eventName
                     );
                  },).toList()
                  )
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width*0.04
        ),
        child: Column(
          children: [
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
