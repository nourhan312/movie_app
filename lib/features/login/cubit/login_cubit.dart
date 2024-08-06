import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/helper/login_hive_helper.dart';
import 'package:movie_app/core/networking/dio_helper.dart';
import 'package:movie_app/features/login/data/models/LoginModel.dart';

import '../../../core/networking/api_endpoints.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel loginModel =LoginModel();

  void login({required String email,
              required String password,}
      )async {
    emit(LoginLoading());
    try {
      final response = await DioHelper.instance.postData(
        path: ApiEndPoints.login,
        body: {
          "email": email,
          "password": password,
        },
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