import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:laraseksy_bloc/utils/imageName.dart';
import 'package:sizer/sizer.dart';

class CardTopProfile extends StatelessWidget {
  const CardTopProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: const BoxDecoration(
        color: Pallete.tertiarySecondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 22.w,
            height: 11.h,
            child: CircleAvatar(
              radius: 15.h,
              backgroundColor: Pallete.greyListProfileColor,
              child: SizedBox(
                width: 20.w,
                height: 11.h,
                child: CircleAvatar(
                  backgroundColor: Pallete.primaryColor,
                  radius: 15.h,
                  child: Image.asset(
                    ImageName.imageLoginSeek,
                    height: 10.h,
                  ),
                ),
              ),
            ),
          ),
          AutoSizeText(
            'Adam Hendra',
            maxLines: 1,
            minFontSize: 12,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          AutoSizeText(
            '23232',
            maxLines: 1,
            minFontSize: 12,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.bold, color: Pallete.greyDarkColor),
          ),
          AutoSizeText(
            'Teknik Informatika',
            maxLines: 1,
            minFontSize: 12,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.bold, color: Pallete.greyDarkColor),
          )
        ],
      ),
    );
  }
}
