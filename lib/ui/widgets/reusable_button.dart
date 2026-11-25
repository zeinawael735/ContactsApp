import 'package:flutter/material.dart';
import 'package:flutter_contacts_session4/core/constants/app_colors.dart';

class ReusableButton extends StatelessWidget {
  Color bgColor;
  String text;
  Color textColor;
  double horizontalPadding;
  void Function()? onPressed;
  bool hasIcon;
  IconData icon;

  double verticalPadding;
  new({super.key, required this.bgColor, required this.text,required this.textColor,required this.horizontalPadding,required this.onPressed,this.verticalPadding=16,this.hasIcon=false,this.icon=Icons.insert_drive_file_rounded});

@override
Widget build(BuildContext context) {
  return ElevatedButton(
    onPressed: onPressed,

    style: ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
    ),

    child: Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
      child:hasIcon?Row(
        mainAxisAlignment: .center,
        spacing: 5,
        children: [
          Icon(icon,color: AppColors.white,),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: .bold,
              color: textColor,
            ),
          ),
        ],
      ): Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: .bold,
          color: textColor,
        ),
      ),
    ),
  );
}
}