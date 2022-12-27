import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/Login/views/components/boxLogin.dart';
import 'package:laraseksy_bloc/Login/views/components/headerLogin.dart';
import 'package:laraseksy_bloc/globalComponents/VerticalSpace.dart';
import 'package:laraseksy_bloc/globalComponents/customFormFIeld.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:laraseksy_bloc/utils/imageName.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              const HeaderLogin(),
              BoxLogin(),
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Image.asset(
                      ImageName.imageLogin,
                    ),
                  )),
            ],
          ),
        ));
  }
}
