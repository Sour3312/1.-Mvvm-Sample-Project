import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_with_map/repository/Auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {
      if (kDebugMode) {
        print("And here is your value: ${value.toString()}");
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('The error is: ${error.toString()}');
      }
    });
  }
}
