import 'package:chatbox/blocs/auth_cubit.dart';
import 'package:chatbox/screen/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthDartCubit(),
        child: const SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  String combinedErrorMessage ="";
  bool isSignUpEnabled = false;
  late File? _image;
  late AuthDartCubit authDartCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authDartCubit = context.read<AuthDartCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthDartCubit, AuthDartState>(
      builder: (context, state) {

        combinedErrorMessage = "";
        if(authDartCubit.state is AuthError){
          combinedErrorMessage += (authDartCubit.state as AuthError).error + "\n";
        }

        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Sign up with Email",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Get chatting with friends and family today by"),
                    const Text("signing up for our chat app"),
                    const SizedBox(height: 20.0),
                    Image.asset(
                      "assets/images/image.png",
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          // Kiểm tra dữ liệu và cập nhật trạng thái
                          isSignUpEnabled = value.isNotEmpty;
                        });
                      },
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          // Kiểm tra dữ liệu và cập nhật trạng thái
                          isSignUpEnabled = value.isNotEmpty;
                        });
                      },
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          // Kiểm tra dữ liệu và cập nhật trạng thái
                          isSignUpEnabled = value.isNotEmpty;
                        });
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          // Kiểm tra dữ liệu và cập nhật trạng thái
                          isSignUpEnabled = value.isNotEmpty;
                        });
                      },
                      controller: confirmController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Visibility(
                      visible: isSignUpEnabled && (usernameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty || confirmController.text.isEmpty),
                      child: Text(
                         combinedErrorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isSignUpEnabled
                          ? () {
                              // Xử lý khi nút được nhấn
                              authDartCubit.signUp(
                                  usernameController.text,
                                  emailController.text,
                                  passwordController.text,
                                  confirmController.text, (authUser) async {
                                if (state is AuthSuccess) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                }
                              });
                            }
                          : null, // Vô hiệu hóa nút khi không có dữ liệu
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSignUpEnabled
                            ? const Color(0xff24786d)
                            : const Color(0xfff3f6f6),
                        minimumSize: const Size(400, 50),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
