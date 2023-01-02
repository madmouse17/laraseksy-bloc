import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:laraseksy_bloc/Login/Models/loginModels.dart';
import 'package:laraseksy_bloc/Login/Provider/loginProvider.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    LoginProvider loginProvider = LoginProvider();
    on<LoginEventClick>((event, emit) async {
      // emit(Loading());
      print(event.nis);
      LoginModels? loginModels;
      var a;

      try {
        await loginProvider.postLoginData(
          dataQuery: {'nis': event.nis, 'password': event.password},
          onSuccess: (value) {
            loginModels = value;
          },
          onErrorData: (error) {
            print(error);

            a = error;
            // AlertController.alertErrorData(errorData: error);
          },
        );
        print(loginModels);
        print(a);
      } catch (e) {
        print('error');
      }
    });
  }
}
