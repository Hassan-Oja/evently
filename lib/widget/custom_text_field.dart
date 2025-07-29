import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

typedef onValidator = String? Function(String?)? ;
class CustomTextFormField extends StatelessWidget {
  Color colorBorder;
  String? hintText ;
  TextStyle? hintStyle;
  String? labelText ;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController controller;
  onValidator? validator ;
  TextInputType? keyBoardType ;
  bool obscureText ;
  String? obscuringCharacter ;
  int? maxLines;


  CustomTextFormField({super.key,
    this.colorBorder = AppColors.gray,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.validator,
    this.keyBoardType = TextInputType.text ,
    this.obscureText = false ,
    this.obscuringCharacter,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(

        enabledBorder: borderDecoration(colorBorder: colorBorder),
        focusedBorder: borderDecoration(colorBorder: colorBorder),
        errorBorder: borderDecoration(colorBorder: AppColors.red),
        focusedErrorBorder: borderDecoration(colorBorder: AppColors.red),
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.midum16gray,
        labelText: labelText,
        labelStyle: labelStyle ?? AppStyles.midum16gray,
        prefixIcon: prefixIcon,
        suffix: suffixIcon,
        errorStyle: AppStyles.midum16gray.copyWith(
          color: AppColors.red
        )
      ),
      keyboardType: keyBoardType ,
      obscureText: obscureText ,
      controller: controller ,
      validator: validator,
      cursorColor: AppColors.primary,
      obscuringCharacter: obscuringCharacter ?? '.' ,
    );
  }
  OutlineInputBorder borderDecoration({required Color colorBorder}){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
            color: colorBorder ,
            width: 2
        )
    );
  }
}
