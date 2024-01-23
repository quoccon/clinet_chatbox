import 'package:bloc/bloc.dart';
import 'package:chatbox/models/AuthUser.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;

part 'auth_state.dart';

class AuthDartCubit extends Cubit<AuthDartState> {
  final Dio dio = Dio();
  late Io.Socket _socket;

  AuthDartCubit() : super(AuthDartInitial());

  //Signup
  Future<void> signUp(
      String usernameController,
      String emailController,
      String passwordController,
      String confirmPassword,
      Function(AuthUser) callback) async {
    final username = usernameController;
    final email = emailController;
    final password = passwordController;

    if(username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty){
      emit(AuthError(error: "Vui lòng nhập đầy đủ thông tin"));
    }
    try {
      final response = await dio.post("http://10.0.2.2:1906/signup/api", data: {
        'username': username,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword
      });
      print('Data == $response');
      AuthUser authUser = AuthUser.fromJson(response.data);
      if (email == authUser.user?.email) {
        emit(AuthError(error: "Email đã đã được đăng ký"));
      }
    } catch (e) {
      print('Error signUp : ${e}');
    }
  }

  Future<void> login(String emailController, String passwordController,
      Function(AuthUser) callback) async {
    final email = emailController;
    final password = passwordController;
    if(email.isEmpty || password.isEmpty){
      emit(AuthError(error: "Vui lòng nhập đầy đủ thông tin"));
    }
    try {
      final response = await dio.post('http://10.0.2.2:1906/login/api',
          data: {'email': email, 'password': password});
      print('Data login == $response');
      if (response.statusCode == 200) {
        AuthUser authUser = AuthUser.fromJson(response.data);
        emit(AuthSuccess(user: authUser));
        callback.call(authUser);
        // if(authUser.user?.email != email){
        //   print('Email không đúng');
        // }
        if (password != authUser.user?.password) {
          emit(AuthError(error: "Mật khẩu không trùng khớp"));
        } else if (email != authUser.user?.email) {
          emit(AuthError(error: "Email nhập không chính xác"));
        }
        print('idU == ${authUser.user?.userId}');
        _startWebSocketConnection(authUser.user?.userId);
      } else if (response.data == 404) {
        emit(AuthError(error: "User not found"));
      }
    } catch (e) {
      print('Lỗi đăng nhập : ${e}');
    }
  }

  void _startWebSocketConnection(String? userId) {
    _socket = Io.io("http://localhost:1906", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    _socket.on('connection', (data) {
      print('Connected to server $data');
    });

    _socket.connect();
    _socket.emit('userd', userId);
  }

  Future<void> getAllUser() async {
    try {
      final response = await dio.get("http://10.0.2.2:1906/api/getallUser");
      print('Danh sách user : $response');
    } catch (e) {
      print('Lỗi lấy danh sachs : $e');
    }
  }
}
