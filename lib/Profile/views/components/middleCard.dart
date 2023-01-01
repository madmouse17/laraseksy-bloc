import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:sizer/sizer.dart';

class MiddleCardProfile extends StatelessWidget {
  const MiddleCardProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30.h,
      right: 5.w,
      left: 5.w,
      child: Container(
        height: 20.h,
        width: 90.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Pallete.tertiaryColor,
            borderRadius: BorderRadius.circular(40)),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 100.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Pallete.boxLoginColor,
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 0.5.w),
                        ),
                      ),
                      child: const Text(
                        'Semester 1',
                        style: TextStyle(
                            color: Pallete.primaryDarkColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Flexible(
                      flex: 2,
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Pallete.boxLoginColor,
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white, width: 0.5.w),
                                  right: BorderSide(
                                      color: Colors.white, width: 0.5.w),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Masuk :',
                                    style: TextStyle(
                                        color: Pallete.primaryDarkColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  AutoSizeText(
                                    '10',
                                    maxLines: 1,
                                    minFontSize: 8,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: Pallete.primaryDarkColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Pallete.boxLoginColor,
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white, width: 0.5.w),
                                  right: BorderSide(
                                      color: Colors.white, width: 0.5.w),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Ijin :',
                                    style: TextStyle(
                                        color: Pallete.orangeColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  AutoSizeText(
                                    '10',
                                    maxLines: 1,
                                    minFontSize: 8,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: Pallete.orangeColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Pallete.boxLoginColor,
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white, width: 0.5.w),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Ijin :',
                                    style: TextStyle(
                                        color: Pallete.redColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  AutoSizeText(
                                    '10',
                                    maxLines: 1,
                                    minFontSize: 8,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: Pallete.redColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Pallete.boxLoginColor,
                        border: Border(
                          top: BorderSide(color: Colors.white, width: 0.5.w),
                        ),
                      ),
                      child: const Text(
                        '2022/2023',
                        style: TextStyle(
                            color: Pallete.primaryDarkColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: Pallete.tertiaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kelas :',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Pallete.primaryDarkColor,
                          fontWeight: FontWeight.bold),
                    ),
                    AutoSizeText(
                      '7',
                      maxLines: 1,
                      minFontSize: 8,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Pallete.primaryDarkColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
