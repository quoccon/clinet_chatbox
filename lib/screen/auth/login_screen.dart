import 'package:chatbox/blocs/auth_cubit.dart';
import 'package:chatbox/naviation.dart';
import 'package:chatbox/screen/widget/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => AuthDartCubit(),
      child: const LoginForm(),
    ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Biến để kiểm soát trạng thái của nút
  bool isLoginEnabled = false;
  late AuthDartCubit authDartCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authDartCubit = context.read<AuthDartCubit>();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<AuthDartCubit, AuthDartState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Log in to Chatbox",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Welcome back! Sign in using your social",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      "account or email to continue us",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Image.asset("assets/images/facebook.png",
                              width: 50, height: 50),
                        ),
                        const SizedBox(width: 10.0),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Image.asset("assets/images/google.png",
                              width: 50, height: 50),
                        ),
                        const SizedBox(width: 10.0),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Image.asset("assets/images/apple.png",
                              width: 50, height: 50),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text("OR"),
                    const SizedBox(height: 20),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          isLoginEnabled = value.isNotEmpty;
                        });
                      },
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          isLoginEnabled = value.isNotEmpty;
                        });
                      },
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: isLoginEnabled
                                ? () {
                                    authDartCubit.login(emailController.text,
                                        passwordController.text,
                                        (authUser) async {
                                          print('Login with id ${authUser.user?.userId}');
                                      if (state is AuthSuccess) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            });
                                        await Future.delayed(
                                            const Duration(seconds: 2));
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const NavigationBottom()));
                                      }
                                    });
                                  }
                                : null, // Vô hiệu hóa nút khi không có dữ liệu
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isLoginEnabled
                                  ? const Color(0xff24786d)
                                  : const Color(0xfff3f6f6),
                              minimumSize: const Size(400, 50),
                            ),
                            child: const Text('Log in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              // Xử lý khi quên mật khẩu được nhấn
                            },
                            child: const Text("Forgot password?",
                                style: TextStyle(
                                    color: Color(0xff24786d),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
