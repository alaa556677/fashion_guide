import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/colors.dart';

class ChatTextFormField extends StatelessWidget{
  final double radius;
  final Color borderColor;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextEditingController controller;
  final int minLines;
  final int maxLines;
  final TextInputType? textInputType;
  final bool readOnly;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? icon;
  final Color fillColor;
  final List<BoxShadow>? boxShadow;
  final double startPadding;
  final double endPadding;

  const ChatTextFormField({
    super.key,
    required this.controller,
    this.radius = 0,
    this.borderColor = Colors.transparent,
    this.validator,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.textInputType,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.icon,
    this.fillColor = Colors.white,
    this.boxShadow,
    this.startPadding = 0,
    this.endPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: fillColor,
        border: Border.all(color: borderColor),
        boxShadow: boxShadow
      ),
      child: TextFormField(
        style: TextStyle(
          color: AppColors.blackColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        keyboardType: textInputType,
        readOnly: readOnly,
        onChanged: onChanged,
        onTap: onTap,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsetsDirectional.only(
            start: startPadding,
            end: endPadding,
            bottom: 0,
            top: 8
          ),
          hintStyle: TextStyle(
            color: AppColors.chatHintColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          icon: Padding(
            padding: EdgeInsetsDirectional.only(start: 12.w),
            child: icon,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}