import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String email;
  final String password;

  const User({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

class UserResponse extends Equatable {
  final String responseCode;
  final String responseMessage;

  const UserResponse({this.responseCode, this.responseMessage});

  @override
  List<Object> get props => [responseCode, responseMessage];
}
