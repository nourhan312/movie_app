import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theming/text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2C018),
      appBar: AppBar(
        backgroundColor: Color(0xFFE2C018),
        leading: Icon(Icons.arrow_back_ios,size: 30,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            Text("LOG-IN",style:TextStyles.font48SemiBold),
            SizedBox(height: 50,),
            Text_Form_Field("Enter Your E-mail"),
            SizedBox(height: 10,),
            Text_Form_Field("Enter Password"),
            SizedBox(height: 50,),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Log-In",textAlign: TextAlign.center,style:TextStyles.font27semiBold),
              ),
            ),
            SizedBox(height: 25,),
            Row(
              children: [
                Icon(Icons.square_outlined,size: 35),
                Text("Remember Me",style:TextStyles.font22Regular),
              ],
            ),
            SizedBox(height: 70,),
            Row(
              children: [
                Text("New to our app?",style:TextStyles.font20Regular,),
                SizedBox(width: 5,),
                Text("Sign-Up Now",style: TextStyles.font20Medium,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
Widget Text_Form_Field(String text){
  return TextFormField(
    decoration: InputDecoration(
      hintText: text,
      helperStyle: TextStyles.font25Regular,
    ),
  );
}