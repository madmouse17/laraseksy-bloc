import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:laraseksy_bloc/utils/imageName.dart';
import 'package:sizer/sizer.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: 100.h,
      width: 100.w,
      child: Column(
        children: [
          const HeaderLogin(),
          Flexible(
              flex: 3,
              child: Container(
                color: Colors.blue,
              )),
          Flexible(flex: 1, child: Container()),
        ],
      ),
    ));
  }
}

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
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              child: Row(
                children: [
                  Image.asset(ImageName.imageLoginTut),
                  Text('SMP Negeri Tut Wuri Handayani'.toUpperCase())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
