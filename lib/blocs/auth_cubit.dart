import 'package:bloc/bloc.dart';
import 'package:chatbox/models/AuthUser.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

part 'auth_state.dart';

class AuthDartCubit extends Cubit<AuthDartState> {
  final Dio dio = Dio();

  AuthDartCubit() : super(AuthDartInitial());

  //Signup
  Future<void> signUp(String usernameController, String emailController,
      String passwordController, String confirmPassword,Function() callback) async {
    final username = usernameController;
    final email = emailController;
    final password = passwordController;
    try {
      final response = await dio.post("http://10.0.2.2:1906/signup/api", data: {
        'username': username,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword
      });
      print('Data == $response');
    } catch (e) {
      print('Error signUp : ${e}');
    }
  }

  Future<void> login(String emailController, String passwordController,
      Function(AuthUser) callback) async {
    final email = emailController;
    final password = passwordController;
    try {
      final response = await dio.post('http://10.0.2.2:1906/login/api',
          data: {'email': email, 'password': password});
      print('Data login == $response');
      if (response.statusCode == 200) {
        AuthUser authUser = AuthUser.fromJson(response.data);
        emit(AuthSuccess(user: authUser));
        callback.call(authUser);
        if(authUser.user?.email != email){
          print('Email không đúng');
        }
      }else if(response.data == 404){
        emit(AuthError(error: "User not found"));
      }


    } catch (e) {
      print('Lỗi đăng nhập : ${e}');
    }
  }
}
