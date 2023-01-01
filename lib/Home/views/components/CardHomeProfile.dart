import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:laraseksy_bloc/utils/imageName.dart';
import 'package:sizer/sizer.dart';

class CardHomeProfile extends StatelessWidget {
  const CardHomeProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 100.w,
      margin: EdgeInsets.only(left: 2.w),
      decoration: const BoxDecoration(
        gradient: LinearGradient(stops: [
          0.1,
          0.7
        ], colors: [
          Pallete.tertiarySecondaryColor,
          Pallete.tertiaryColor,
        ]),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 1.5.w, vertical: 1.5.h),
                    child: CircleAvatar(
                      radius: 15.h,
                      child: Image.asset(
                        ImageName.imageLoginSeek,
                        height: 40.h,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 1.w),
                            child: Text(
                              'Semester 1',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8.sp),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Selamat Belajar,',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      AutoSizeText(
                        'Adam Hendra',
                        maxLines: 1,
                        minFontSize: 10,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      AutoSizeText(
                        'Teknik Informatika',
                        maxLines: 1,
                        minFontSize: 8,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Pallete.greyDarkColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: 100.w,
              decoration: const BoxDecoration(
                color: Pallete.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "KELAS :",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    "7",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    "2022/2023",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
