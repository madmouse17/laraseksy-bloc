import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/dashicons.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:laraseksy_bloc/Profile/views/components/bottomProfile.dart';
import 'package:laraseksy_bloc/Profile/views/components/cardTopProfile.dart';
import 'package:laraseksy_bloc/Profile/views/components/middleCard.dart';
import 'package:laraseksy_bloc/globalComponents/VerticalSpace.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:laraseksy_bloc/utils/imageName.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            SizedBox(
              height: 40.h,
              child: const CardTopProfile(),
            ),
            const MiddleCardProfile(),
            const BottomProfile()
          ],
        ),
      ),
    );
  }
}
