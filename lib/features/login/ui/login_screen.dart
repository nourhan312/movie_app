import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/widgets/primary_color_widget.dart';
import 'package:movie_app/features/login/cubit/login_cubit.dart';
import '../../../core/theming/text_style.dart';
import '../../home_screen/ui/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Get.offAll(const HomeScreen());
        }
        if (state is LoginError) {
          Get.snackbar("Error", state.msg,
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: PrimaryColorWidget(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: SingleChildScrollView(
                child: Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 120,
                      ),
                      Text("LOG-IN", style: TextStyles.font48SemiBold),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTexFormField(
                          hintText: "Enter Your E-mail",
                          controller: _emailController,
                          validator: (value) {
                            if (!value!.emailValid) {
                              return "please enter a valid email";
                            }
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTexFormField(
                        hintText: "Enter Password",
                        controller: _passwordController,
                        isPassword: true,
                        validator: (value) {
                          if (!value!.passwordValid) {
                            return "please enter a valid password";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_form.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                                email: _emailController.text,
                                password: _passwordController.text);
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                if (state is LoginLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return Text("Log-In",
                                    textAlign: TextAlign.center,
                                    style: TextStyles.font27semiBold);
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        children: [
                          Text(
                            "New to our app?",
                            style: TextStyles.font20Regular,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              context.pushReplacementNamed(Routes.signUpScreen);
                            },
                            child: Text(
                              "Sign-Up Now",
                              style: TextStyles.font20Medium,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// void didChangeDependencies(){
// if(!isActive){
// timer!.cancel();
// if(TokenHelper.getToken()==null){
//Future.delayed(Duration(seconds:3))
// then((v)=> Get.ofAll(()=> HomeScreen()));
//}
// }
// super.didChangeDependencies():
// }
