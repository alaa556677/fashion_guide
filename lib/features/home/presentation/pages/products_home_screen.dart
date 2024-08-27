import 'package:fashion_guide/features/home/presentation/pages/widgets/view_more_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/images_path.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/text_default.dart';
import '../cubit/home_cubit.dart';

class ProductsHomeScreen extends StatelessWidget{
  const ProductsHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              width: AppScreenSize.screenWidth(context),
              height: 202.h,
              child: SvgPicture.asset(AppImagesPath.productBackground)),
          SizedBox(height: 20.h,),
          SizedBox(
            height: 34.h,
            child: Row(
              children: [
                ButtonCustomWidget(
                  text: 'All',
                  buttonHeight: 34.h,
                  buttonColor: AppColors.buttonColorAll,
                  buttonWidth: 86.w,
                  textSize: 16.sp,
                  fontWeightText: FontWeight.w400,
                  color: AppColors.whiteColor,
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ButtonCustomWidget(
                      text: HomeCubit.instance.categoryList[index].name,
                      horizontalPadding: 12.w,
                      buttonColor: AppColors.buttonColorCategory,
                      color: AppColors.textColorCategory,
                      fontWeightText: FontWeight.w300,
                      textSize: 16.sp,
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 10.w,),
                    itemCount: HomeCubit.instance.categoryList.length
                  )
                )
              ],
            ),
          ),
          SizedBox(height: 28.h,),
          ViewMoreWidget(
            title: 'Top Rank',
            list: HomeCubit.instance.topRankList,
          ),
          SizedBox(height: 20.h,),
          ViewMoreWidget(
            title: 'Vehicle Parts',
            list: HomeCubit.instance.vehiclePartsList,
          ),
          SizedBox(height: 20.h,),
          ViewMoreWidget(
            title: 'Modern',
            list: HomeCubit.instance.modernList,
          ),
          SizedBox(height: 20.h,),
          TextWidget(
            text: 'Just For You',
            fontWeight: AppFontWeight.bold,
            fontSize: 18.sp,
            fontColor: AppColors.textColorCategory,
          ),
          SizedBox(height: 18.h,),
          Container(
            width: AppScreenSize.screenWidth(context),
            height: 148.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImagesPath.mediaOne),
                fit: BoxFit.fill,
              )
            ),
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 148.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImagesPath.mediaTwo),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Container(
                  height: 148.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImagesPath.mediaThree),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          ViewMoreWidget(
            title: 'Others',
            list: HomeCubit.instance.modernList,
          ),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  }
}