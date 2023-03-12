import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/Models/errorModels.dart';
import 'package:laraseksy_bloc/Models/succesModels.dart';
import 'package:laraseksy_bloc/routes/routes.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:laraseksy_bloc/utils/navigatorKey.dart';

class AlertBottom {
  snackBarNotAuth({required errorModels}) {
    ErrorModels error = errorModelsFromJson(errorModels);

    ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
        .showSnackBar(SnackBar(
      content: Text(error.errors.failed[0],
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: Pallete.redAccentColor,
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Login Ulang',
        textColor: Colors.white,
        onPressed: () => NavigationService.navigatorKey.currentState!
            .popAndPushNamed(Routes.login),
      ),
    ));
    NavigationService.navigatorKey.currentState!.popAndPushNamed(Routes.login);
  }

  snackBarSuccessAlert({required message}) {
    SuccessModels success = successModelsFromJson(message);

    ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
        .showSnackBar(SnackBar(
      content: Text(success.message,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: Pallete.primaryColor,
      action: SnackBarAction(
        label: success.title,
        textColor: Colors.white,
        onPressed: () {
          NavigationService.navigatorKey.currentState!.pop();
        },
      ),
    ));
  }

  snackBarAlertNoData({required message}) {
    ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
        .showSnackBar(SnackBar(
      content: Text(message,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: Pallete.redAccentColor,
      action: SnackBarAction(
        label: 'Error',
        textColor: Colors.white,
        onPressed: () {
          NavigationService.navigatorKey.currentState!.pop();
        },
      ),
    ));
  }

  snackBarAlertData({required String errorData}) {
    ErrorModels error = errorModelsFromJson(errorData);

    ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
        .showSnackBar(SnackBar(
      content: Text(error.errors.failed[0],
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: Pallete.redAccentColor,
      action: SnackBarAction(
        label: 'Error',
        textColor: Colors.white,
        onPressed: () {
          NavigationService.navigatorKey.currentState!.pop();
        },
      ),
    ));
  }

  onErrorAlertDioDefault({required error}) {
    if (error.response != null) {
      if (error.response!.statusCode == 401) {
        AlertBottom().snackBarNotAuth(errorModels: error.response.toString());
      } else {
        AlertBottom().snackBarAlertData(errorData: error.response.toString());
      }
    } else {
      AlertBottom().snackBarAlertNoData(message: error.message);
    }
  }

  hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}
