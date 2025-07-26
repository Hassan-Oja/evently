import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
class CustomElevatedBottom extends StatelessWidget {
  VoidCallback onPressed ;
  String text ;
  Color? backGroundColor ;
  Color? borderColor ;

   CustomElevatedBottom({
     super.key ,
     required this.onPressed ,
     required this.text,
     this.backGroundColor = AppColors.primary,
     this.borderColor = AppColors.transparent,

   });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
            text,
          style: AppStyles.midum20White,
        ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        padding: EdgeInsets.symmetric(
          vertical: height*0.02
        )
      ),
    );
  }
}
