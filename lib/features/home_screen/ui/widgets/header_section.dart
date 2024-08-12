
import 'package:flutter/material.dart';
import 'package:movie_app/features/home_screen/ui/widgets/popup_section.dart';
import '../../../../core/theming/text_style.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 20,right: 10),
      child: Row(
        children: [
          Text(
            "What do you want to watch?",
            style: TextStyles.font18SemiBoldWhite,
          ),
          const Spacer(),
          // const PopupSection(),
        ],
      ),
    );
  }
}


