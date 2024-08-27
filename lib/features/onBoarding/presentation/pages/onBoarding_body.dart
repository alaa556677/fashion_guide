import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/images_path.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/richText_default.dart';

class OnBoardingBody extends StatelessWidget{
  final String description;
  const OnBoardingBody({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AppImagesPath.backgroundEarth),
            SvgPicture.asset(AppImagesPath.earthImage, width: 220.w, height: 220.h,),
          ],
        ),
        SizedBox(height: 62.h,),
        SvgPicture.asset(AppImagesPath.appName2),
        SizedBox(height: 30.h,),
        RichTextWidget(
          text: description,
          fontColor: AppColors.textColorOnBoarding,
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          align: TextAlign.center,
          height: 1.6.h,
        )
      ],
    );
  }
}