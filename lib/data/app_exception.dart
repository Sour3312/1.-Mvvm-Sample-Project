// ignore_for_file: unused_field, prefer_typing_uninitialized_variables

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException(this._message, this._prefix);

  // @override
  String toString() {
    return "$_prefix$_message";
  }
}

//exceptions handeled which may occur
//1.
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

//2.
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

//3.
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorised request');
}

//4.
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

//can also write on this way with prefix & message both//////////////////
//4.
// class InvalidInputException extends AppException {
//   InvalidInputException([String? message,String? prefix]) : super('Invalid Input','gfhgs');
// }