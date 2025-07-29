import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/home/tabs/Favorite/favorite_tab.dart';
import 'package:evently/ui/home/tabs/Home/home_tab.dart';
import 'package:evently/ui/home/tabs/Map/map_tab.dart';
import 'package:evently/ui/home/tabs/profile/profile_tab.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../utils/app_assets.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    List<Widget> tabs = [HomeTab(), MapTab() , FavoriteTab() , ProfileTab()];
   int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(0),
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        color: Theme.of(context).primaryColor,
        child: BottomNavigationBar(
          currentIndex: selectedIndex ,
          onTap: (index){
            selectedIndex = index ;
            setState(() {
        
            });
            } ,
            items: [
              buildBottomNavigationBarItem(
                  index: 0,
                  selectedIcon: AppAssets.selectedHomeIcon,
                  iconName: AppAssets.homeIcon,
                  label: AppLocalizations.of(context)!.home
              ),
              buildBottomNavigationBarItem(
                  index: 1,
                  selectedIcon: AppAssets.selectedMapIcon,
                  iconName: AppAssets.mapIcon,
                  label: AppLocalizations.of(context)!.map
              ),
              buildBottomNavigationBarItem(
                  index: 2,
                  selectedIcon: AppAssets.selectedFavoriteIcon,
                  iconName: AppAssets.favoriteIcon,
                  label: AppLocalizations.of(context)!.love
              ),
              buildBottomNavigationBarItem(
                  index: 3,
                  selectedIcon: AppAssets.selectedProfileIcon,
                  iconName: AppAssets.profileIcon,
                  label: AppLocalizations.of(context)!.profile
              ),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            //todo: navigate to create event
            Navigator.of(context).pushNamed(AppRoutes.addEventScreen);
          },
        child: Icon(Icons.add , color: AppColors.white , size: 40,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({required String iconName ,
    required String label ,
    required String selectedIcon,
    required int index
     }) {
    return BottomNavigationBarItem(
        icon: ImageIcon(
            AssetImage(selectedIndex == index ? selectedIcon : iconName)
        ),
        label: label
    );
  }
}
