import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laraseksy_bloc/Home/bloc/home_bloc.dart';
import 'package:laraseksy_bloc/Home/views/home.dart';
import 'package:laraseksy_bloc/Login/bloc/login_bloc.dart';
import 'package:laraseksy_bloc/Login/views/login.dart';
import 'package:laraseksy_bloc/routes/routes.dart';

class Pages {
  // ignore: non_constant_identifier_names
  static String Initial = Routes.login;

  static routes(context) => {
        Routes.login: (context) => BlocProvider(
              create: (context) => LoginBloc(),
              child: Login(),
            ),
        Routes.home: (context) => BlocProvider(
              create: (context) => HomeBloc(),
              child: Home(),
            ),
      };
}
