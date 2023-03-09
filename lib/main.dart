import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/routes/Pages.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laraseksy_bloc/utils/navigatorKey.dart';
import 'package:sizer/sizer.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

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
        navigatorKey: NavigationService.navigatorKey,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            inputDecorationTheme: InputDecorationTheme(
                focusedBorder: BorderCustom(),
                enabledBorder: BorderCustom(),
                border: BorderCustom(),
                errorBorder: BorderCustom(),
                disabledBorder: BorderCustom(),
                focusedErrorBorder: BorderCustom(),
                fillColor: Colors.white,
                filled: true),
            primarySwatch: colorCustom,
            backgroundColor: Pallete.bgolor),
        initialRoute: Pages.Initial,
        routes: Pages.routes(context),
      );
    });
  }

  OutlineInputBorder BorderCustom() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.white, width: 0.0),
    );
  }
}
