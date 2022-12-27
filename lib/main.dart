import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/routes/Pages.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'LaraSeksy',
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            primarySwatch: colorCustom,
            backgroundColor: Pallete.bgolor),
        initialRoute: Pages.Initial,
        routes: Pages.routes(context),
      );
    });
  }
}
