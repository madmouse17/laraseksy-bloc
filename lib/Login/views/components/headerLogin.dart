import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:laraseksy_bloc/utils/imageName.dart';
import 'package:sizer/sizer.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        margin: EdgeInsets.only(left: 3.w),
        decoration: const BoxDecoration(
          color: Pallete.tertiarySecondaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(400),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -15.h,
              right: -15.w,
              child: Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: Pallete.primaryColor.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: -16.h,
              right: -15.w,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Pallete.primaryColor.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, top: 5.h, bottom: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImageName.imageLoginTut,
                    height: 10.h,
                  ),
                  Container(
                    width: 60.w,
                    padding: EdgeInsets.only(left: 1.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'SMP Negeri Tut Wuri Handayani'.toUpperCase(),
                          maxLines: 2,
                          minFontSize: 10,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        AutoSizeText(
                          'Jl. Merdeka Raya no.17 Kota Surakarta',
                          maxLines: 2,
                          minFontSize: 10,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
