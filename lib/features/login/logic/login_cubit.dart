import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/helper/login_hive_helper.dart';
import 'package:movie_app/core/networking/auth_api.dart';
import 'package:movie_app/features/login/data/models/LoginModel.dart';

import '../../../core/networking/api_endpoints.dart';
import '../data/models/user_credintioal.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel loginModel = LoginModel();
  final form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login({required String email,
              required String password,}
      )async {
    emit(LoginLoading());
    try {
      final response = await AuthApi.postData(
        path: ApiEndPoints.login,
        body: UserCredentials.toJson(email, password),
      );
      loginModel = LoginModel.fromJson(response.data);
      if(loginModel.status == true){
        TokenHelper.saveToken(loginModel.data!.token!);
        emit(LoginSuccess(loginModel.message!));
      }else{
        emit(LoginError(loginModel.message!));
      }
    }catch(e){
      emit(LoginError("An error occurred"));
    }
  }
}