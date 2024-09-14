import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TopCircle extends StatelessWidget {
  const TopCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 173.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 30.w,
            height: 18.h,
            child: Transform.scale(
              scale: 8.r,
              child: SvgPicture.asset('assets/images/top_circle.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
