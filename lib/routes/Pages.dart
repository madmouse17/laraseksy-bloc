import 'package:laraseksy_bloc/Login/views/login.dart';
import 'package:laraseksy_bloc/routes/routes.dart';

class Pages {
  // ignore: non_constant_identifier_names
  static String Initial = Route.login;

  static routes(context) => {
        Route.login: (context) => const Login(),
      };
}
