import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'home/tabs/Favorite/favorite_tab.dart';
import 'home/tabs/Home/home_tab.dart';
import 'home/tabs/Map/map_tab.dart';
import 'home/tabs/profile/profile_tab.dart';
class HomeScreen1 extends StatefulWidget {
   HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  List<Widget> tabs = [HomeTab(), MapTab() , FavoriteTab() , ProfileTab()];
  int selectedIndex = 0 ;

   final List<IconData> unselectedIcons = [
     Icons.home_outlined,
     Icons.map_outlined,
     Icons.favorite_border,
     Icons.person_outline,
   ];

   final List<IconData> selectedIcons = [
     Icons.home,
     Icons.map,
     Icons.favorite,
     Icons.person,
   ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //todo: navigate to create event
        },
        child: Icon(Icons.add , color: AppColors.white , size: 40,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        activeColor: AppColors.white,
        inactiveColor: AppColors.white,
        icons: List.generate(
            selectedIcons.length,
            (index)=>index == selectedIndex ? selectedIcons[index] : unselectedIcons[index]
        ),
        activeIndex: selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => selectedIndex = index),
        //other params
      ),
      body: tabs[selectedIndex],
    );
  }
}
