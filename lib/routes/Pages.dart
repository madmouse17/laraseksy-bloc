import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laraseksy_bloc/Home/bloc/datebloc/date_bloc.dart';
import 'package:laraseksy_bloc/Home/bloc/homebloc/home_bloc.dart';
import 'package:laraseksy_bloc/Home/views/home.dart';
import 'package:laraseksy_bloc/Login/bloc/login_bloc.dart';
import 'package:laraseksy_bloc/Login/views/login.dart';
import 'package:laraseksy_bloc/Profile/views/Profile.dart';
import 'package:laraseksy_bloc/routes/routes.dart';

class Pages {
  // ignore: non_constant_identifier_names
  static String Initial = Routes.login;

  static routes(context) => {
        Routes.login: (context) => BlocProvider(
              create: (context) => LoginBloc(),
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
              ],
              child: const Home(),
            ),
        Routes.profile: (context) => BlocProvider(
              create: (context) => LoginBloc(),
              child: const Profile(),
            ),
      };
}
