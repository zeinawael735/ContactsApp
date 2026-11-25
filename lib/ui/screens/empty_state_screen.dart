import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/app_colors.dart';
import '../widgets/customized_app_bar.dart';

class EmptyStateScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        CustomizedAppBar(),
        Lottie.asset("assets/animations/empty_state.json"),
        Center(
          child: Text(
            "There is No Contacts Added Here",
            style: TextStyle(
              fontSize: 20,
              fontWeight: .w500,
              color: AppColors.gold,
            ),
          ),
        ),
      ],
    );
  }
}
