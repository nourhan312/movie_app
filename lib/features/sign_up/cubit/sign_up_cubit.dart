import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../core/networking/api_endpoints.dart';
import '../../../core/networking/dio_helper.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  void SignUp(){
    final response = DioHelper.postData(
        path: ApiEndPoints.signup,
      body: {
// start
      }


    );
  }
}
