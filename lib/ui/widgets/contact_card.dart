import 'package:flutter/material.dart';
import 'package:flutter_contacts_session4/ui/widgets/reusable_button.dart';

import '../../core/constants/app_colors.dart';
import 'contact_image.dart';

class ContactCard extends StatelessWidget {
  String imagePath;
  String name;
  String email;
  String phone;
  void Function()? onPressed;
  new({
    super.key,
    required this.imagePath,
    required this.name,
    required this.phone,
    required this.email,
  required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 177,
      height: 286,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.gold,
      ),
      child: Column(
        children: [
          Stack(
            alignment: .bottomLeft,
            children: [
              contactImage(imagePath),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsetsGeometry.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w500,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Column(
                spacing: 3,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Icon(Icons.mail, color: AppColors.darkBlue),

                      Expanded(
                        child: Text(
                          email,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: .w500,
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.phone_in_talk_rounded,
                        color: AppColors.darkBlue,
                      ),
                      Expanded(
                        child: Text(
                          phone,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: .w500,
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ReusableButton(
                      bgColor: AppColors.redOrange,
                      text: "Delete",
                      textColor: AppColors.white,
                      horizontalPadding: 20,
                      onPressed: onPressed,
                      verticalPadding: 8,
                      hasIcon: true,
                      icon: Icons.delete,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
