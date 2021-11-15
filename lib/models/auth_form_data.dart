import 'dart:io';

enum Authmode { signUp, login }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  File? image;
  Authmode _mode = Authmode.login;

  bool get isLogin {
    return _mode == Authmode.login;
  }

  bool get isSignup {
    return _mode == Authmode.signUp;
  }

  void toogleAuthMode() {
    _mode = isLogin ? Authmode.signUp : Authmode.login;
  }
}
