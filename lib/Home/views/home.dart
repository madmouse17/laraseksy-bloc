import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/Home/views/components/CardHomeProfile.dart';
import 'package:laraseksy_bloc/Home/views/components/CardTeacherAndDate.dart';
import 'package:laraseksy_bloc/Home/views/components/SlidersHome.dart';
import 'package:laraseksy_bloc/Home/views/components/cardAbsensi.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:laraseksy_bloc/utils/imageName.dart';
import 'package:sizer/sizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Pallete.primaryColor, Pallete.tertiarySecondaryColor],
          ),
        ),
        child: Stack(
          children: [
            Positioned(bottom: 0, child: Image.asset(ImageName.imageBgHome)),
            ListView(
              children: [
                SizedBox(
                  height: 40.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.5.w),
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(72),
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      color: Pallete.tertiarySecondaryColor,
                      child: Column(
                        children: [
                          const CardHomeProfile(),
                          SlidersHome(),
                          const CardTeacherAndDate(),
                        ],
                      ),
                    ),
                  ),
                ),
                const CardAbsensi(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
