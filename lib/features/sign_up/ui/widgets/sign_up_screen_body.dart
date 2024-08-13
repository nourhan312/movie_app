import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/sign_up/ui/widgets/signup_button.dart';
import 'package:movie_app/features/sign_up/ui/widgets/signup_text_form_filed_section.dart';
import '../../../../core/theming/text_style.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      height: MediaQuery.sizeOf(context).height,
      color: Colors.black38,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 90),
          Text(
            'SIGN-UP',
            style: TextStyles.font48SemiBold,
          ),
          const SignUpTextFormFieldSection(),
          const SignUpButton(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an Account?",
                style: TextStyles.font14Medium,
              ),
              TextButton(
                onPressed: () {
                  context.pushReplacementNamed(Routes.loginScreen);
                },
                child: Text(
                  'LogIn Now',
                  style: TextStyles.font18SemiBoldWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
