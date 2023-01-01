import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';

class CardAbsensi extends StatelessWidget {
  CardAbsensi({
    Key? key,
  }) : super(key: key);
  final RoundedLoadingButtonController btnAbsen =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1.h,
            mainAxisExtent: 20.h,
            mainAxisSpacing: 2.w),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Pallete.tertiaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.5.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Bahasa Indonesia',
                        maxLines: 1,
                        minFontSize: 8,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      AutoSizeText(
                        'Martini S.pd',
                        maxLines: 1,
                        minFontSize: 8,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      AutoSizeText(
                        '08:00 -10:00',
                        maxLines: 1,
                        minFontSize: 8,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Divider(
                      color: Colors.black,
                      height: 0,
                      thickness: 2,
                    ),
                    RoundedLoadingButton(
                      color: Pallete.tertiarySecondaryColor,
                      controller: btnAbsen,
                      borderRadius: 0,
                      onPressed: () {},
                      child: const Text('Absen'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
