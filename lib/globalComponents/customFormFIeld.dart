import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'VerticalSpace.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.label,
      required this.controller,
      this.obscureText = false,
      this.textInputType,
      this.suffixIcon})
      : super(key: key);
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 3.w),
          child: AutoSizeText(
            label,
            maxLines: 1,
            minFontSize: 8,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: textInputType,
          decoration: InputDecoration(suffixIcon: suffixIcon),
        ),
        const VerticalSpace()
      ],
    );
  }
}
