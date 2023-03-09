import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laraseksy_bloc/ImagePoint/bloc/cekimagepoint_bloc.dart';
import 'package:laraseksy_bloc/Login/bloc/loginbloc/login_bloc.dart';
import 'package:laraseksy_bloc/Login/bloc/sandivisiblebloc/sandivisible_bloc.dart';
import 'package:laraseksy_bloc/globalComponents/customFormFIeld.dart';
import 'package:laraseksy_bloc/routes/routes.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:laraseksy_bloc/utils/imageName.dart';
import 'package:laraseksy_bloc/utils/navigatorKey.dart';
import 'package:laraseksy_bloc/utils/snackBarCustom.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';

class BoxLogin extends StatelessWidget {
  final RoundedLoadingButtonController btnMasuk =
      RoundedLoadingButtonController();

  final TextEditingController nisText = TextEditingController();

  final TextEditingController sandiText = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: loginKey,
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
                            label: 'NIS',
                            controller: nisText,
                            textInputType: TextInputType.number,
                          ),
                          BlocBuilder<SandivisibleBloc, SandivisibleState>(
                            builder: (context, state) {
                              return CustomTextFormField(
                                label: 'Kata Sandi',
                                controller: sandiText,
                                obscureText: state.visible ? true : false,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      context.read<SandivisibleBloc>().add(
                                          SandiVisibleEvent(
                                              visible: !state.visible));
                                    },
                                    icon: state.visible
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility)),
                              );
                            },
                          ),
                        ],
                      ),
                      BlocBuilder<CekimagepointBloc, CekimagepointState>(
                        builder: (context, state) {
                          return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return RoundedLoadingButton(
                                    controller: btnMasuk,
                                    onPressed: () {
                                      if (loginKey.currentState!.validate()) {
                                        AlertBottom().hideKeyboard();
                                        context.read<LoginBloc>().add(
                                            LoginEventClick(
                                                nis: nisText.text,
                                                password: sandiText.text));
                                        if (state is Success) {
                                          context
                                              .read<CekimagepointBloc>()
                                              .add(CekimagepointEvent());
                                        }
                                        btnMasuk.reset();
                                      } else {
                                        btnMasuk.reset();
                                      }
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
                                  );
                                },
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
