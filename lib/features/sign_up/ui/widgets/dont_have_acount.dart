


import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/extentions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_style.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Don't have Account ? ",
          style: TextStyles.font18SemiBold.copyWith(color: Colors.grey),
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
            style: TextStyles.font18SemiBoldWhite,
          ),
        )
      ],
    );
  }
}

