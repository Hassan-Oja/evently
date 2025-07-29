import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedBottom extends StatelessWidget {
  VoidCallback onPressed;
  String text;
  Color? backGroundColor;
  Color? borderColor;
  Color? textColor;
  bool hasIcon;
  Widget? iconName;
  TextStyle? textStyle;
  MainAxisAlignment? mainAxisAlignment;

  CustomElevatedBottom({
    super.key,
    required this.onPressed,
    required this.text,
    this.backGroundColor = AppColors.primary,
    this.borderColor,
    this.textColor,
    this.hasIcon = false,
    this.iconName,
    this.textStyle,
    this.mainAxisAlignment = MainAxisAlignment.center
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      child: hasIcon
          ? Row(
              mainAxisAlignment: mainAxisAlignment!,
              children: [
                iconName!,
                SizedBox(width: width * 0.025),
                Text(text, style: textStyle),
              ],
            )
          : Text(text, style: AppStyles.midum20White),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(width: 2, color: borderColor ?? AppColors.transparent
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
      ),
    );
  }
}
