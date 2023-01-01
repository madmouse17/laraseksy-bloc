import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/dashicons.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:laraseksy_bloc/globalComponents/VerticalSpace.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';

class BottomProfile extends StatelessWidget {
  const BottomProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 5.w,
      right: 5.w,
      child: Container(
        height: 48.h,
        width: 95.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Umum',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Pallete.primaryDarkColor,
                      fontWeight: FontWeight.bold),
                ),
                ListTile(
                  leading: const Iconify(
                    MaterialSymbols.lock_reset,
                    color: Pallete.primaryDarkColor,
                  ),
                  title: Text('Ganti Kata Sandi',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Pallete.primaryDarkColor)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Pallete.primaryDarkColor,
                  ),
                  tileColor: Pallete.boxLoginColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                const VerticalSpace(),
                ListTile(
                  leading: const Iconify(
                    Dashicons.privacy,
                    color: Pallete.primaryDarkColor,
                  ),
                  title: Text('Kebijakan Privasi',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Pallete.primaryDarkColor)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Pallete.primaryDarkColor,
                  ),
                  tileColor: Pallete.boxLoginColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                const VerticalSpace(),
                ListTile(
                  leading: const Iconify(
                    Ic.outline_privacy_tip,
                    color: Pallete.primaryDarkColor,
                  ),
                  title: Text('Syarat dan Ketentuan',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Pallete.primaryDarkColor)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Pallete.primaryDarkColor,
                  ),
                  tileColor: Pallete.boxLoginColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: RoundedLoadingButton(
                  borderRadius: 5,
                  color: Pallete.redAccentColor,
                  controller: RoundedLoadingButtonController(),
                  onPressed: () {},
                  child: Text(
                    'KELUAR',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Pallete.redDarkColor,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
