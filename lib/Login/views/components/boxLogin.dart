import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laraseksy_bloc/Login/bloc/login_bloc.dart';
import 'package:laraseksy_bloc/globalComponents/customFormFIeld.dart';
import 'package:laraseksy_bloc/routes/routes.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:laraseksy_bloc/utils/imageName.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';

class BoxLogin extends StatelessWidget {
  final RoundedLoadingButtonController btnMasuk =
      RoundedLoadingButtonController();

  final TextEditingController nisText = TextEditingController();

  final TextEditingController sandiText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        margin: EdgeInsets.only(top: 4.h),
        child: Stack(
          children: [
            Positioned(
                top: -0.6.h,
                left: 10.w,
                child: Image.asset(
                  ImageName.imageLoginSeek,
                  height: 10.h,
                )),
            Container(
              margin: EdgeInsets.only(right: 13.w, top: 8.h, bottom: 0.h),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    topRight: Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Pallete.boxLoginColor,
                    Pallete.boxLoginAccentColor,
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CustomTextFormField(
                          label: 'NIS :',
                          controller: nisText,
                          textInputType: TextInputType.number,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            print('widget' + state.visible.toString());
                            return CustomTextFormField(
                              label: 'Kata Sandi :',
                              controller: sandiText,
                              obscureText: state.visible ? true : false,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    context
                                        .read<LoginBloc>()
                                        .add(SandiVisibleEvent());
                                  },
                                  icon: state.visible
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility)),
                            );
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: RoundedLoadingButton(
                        controller: btnMasuk,
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.home);
                        },
                        color: Pallete.tertiaryColor,
                        child: Text(
                          'MASUK',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Pallete.tertiaryDarkColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
