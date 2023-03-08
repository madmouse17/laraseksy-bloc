import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laraseksy_bloc/Home/bloc/cardAbsensibloc/card_absensi_bloc.dart';
import 'package:laraseksy_bloc/Home/bloc/cardHomeProfilebloc/card_home_profile_bloc.dart';
import 'package:laraseksy_bloc/Home/bloc/datebloc/date_bloc.dart';
import 'package:laraseksy_bloc/Home/bloc/homebloc/home_bloc.dart';
import 'package:laraseksy_bloc/Home/bloc/sliderbloc/slider_bloc.dart';
import 'package:laraseksy_bloc/Home/views/home.dart';
import 'package:laraseksy_bloc/ImagePoint/bloc/cekimagepoint_bloc.dart';
import 'package:laraseksy_bloc/ImagePoint/views/cekImagePoint.dart';
import 'package:laraseksy_bloc/Login/bloc/loginbloc/login_bloc.dart';
import 'package:laraseksy_bloc/Login/bloc/sandivisiblebloc/sandivisible_bloc.dart';
import 'package:laraseksy_bloc/Login/views/login.dart';
import 'package:laraseksy_bloc/Profile/bloc/profile_bloc.dart';
import 'package:laraseksy_bloc/Profile/views/Profile.dart';
import 'package:laraseksy_bloc/routes/routes.dart';

class Pages {
  // ignore: non_constant_identifier_names
  static String Initial = Routes.login;

  static routes(context) => {
        Routes.login: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CekimagepointBloc(),
                ),
                BlocProvider(
                  create: (context) => SandivisibleBloc(),
                ),
                BlocProvider(
                  create: (context) => LoginBloc(),
                ),
              ],
              child: const Login(),
            ),
        Routes.home: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => HomeBloc(),
                ),
                BlocProvider(
                  create: (context) => DateBloc(),
                ),
                BlocProvider(
                  create: (context) => SliderBloc(),
                ),
                BlocProvider(
                  create: (context) => CardHomeProfileBloc(),
                ),
                BlocProvider(
                  create: (context) => CardAbsensiBloc(),
                ),
              ],
              child: const Home(),
            ),
        Routes.profile: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ProfileBloc(),
                ),
              ],
              child: const Profile(),
            ),
        Routes.cekimagepoint: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CekimagepointBloc(),
                ),
              ],
              child: const CekImagePoint(),
            ),
      };
}
