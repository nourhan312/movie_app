
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/networking/auth_api.dart';

import '../../../core/helper/login_hive_helper.dart';
import '../../../core/networking/api_endpoints.dart';
import '../data/models/sign_up_response.dart';
import '../data/models/user_model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  late  SignUpResponse signUpResponse;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  Future<void> signUp({required User user}) async {
    emit(SignUpLoading());
    try {
      final response = await AuthApi.postData(
        path: ApiEndPoints.signup,
        body: User.toJson(user),
      );
      signUpResponse = SignUpResponse.fromJson(response.data);
      if(signUpResponse.status == true){
        emit(SignUpSuccess(message: signUpResponse.message.toString()));
      }else{
        emit(SignUpError(errorMessage: signUpResponse.message.toString()));
      }
    }catch(e){
      log(e.toString());
      emit(SignUpError(errorMessage :"An error occurred"));
    }
  }
}