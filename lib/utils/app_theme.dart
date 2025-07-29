import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    dividerColor: AppColors.gray,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      titleLarge: AppStyles.midum16Black,
      headlineLarge: AppStyles.bold20Black,
      headlineMedium: AppStyles.midum16primary,
      headlineSmall: AppStyles.midum16White,
        titleMedium: AppStyles.midum16gray

    ),
    focusColor: AppColors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
      showSelectedLabels: true,
      selectedLabelStyle: AppStyles.bold12White,
      unselectedLabelStyle: AppStyles.bold12White
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75),
          side: BorderSide(
            color: AppColors.white,
            width: 5
          )
        )
      ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.primary,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24) ,
              bottomRight: Radius.circular(24)
          )
      ),
    )
  );


  static final ThemeData darkTheme = ThemeData(
      dividerColor: AppColors.white,
      primaryColor: AppColors.Dark,
      scaffoldBackgroundColor: AppColors.Dark,
      textTheme: TextTheme(
          titleLarge: AppStyles.midum16White,
          headlineLarge: AppStyles.bold20White,
          headlineMedium: AppStyles.midum16White,
          headlineSmall: AppStyles.midum16White,
        titleMedium: AppStyles.midum16White
      ),
      focusColor: AppColors.primary,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.white,
          showSelectedLabels: true,
          selectedLabelStyle: AppStyles.bold12White,
          unselectedLabelStyle: AppStyles.bold12White
      ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.Dark,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75),
            side: BorderSide(
                color: AppColors.white,
                width: 5
            )
        )
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.primary,
      ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24) ,
                bottomRight: Radius.circular(24)
            )
        ),
    )
  );
}