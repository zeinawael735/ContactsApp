import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_contacts_session4/core/utils/validators.dart';
import 'package:flutter_contacts_session4/ui/widgets/reusable_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/contact_model.dart';
import 'custom_text_form_field.dart';

class BottomSheetWidget extends StatefulWidget {
  const new({super.key, required this.onAddContact});
  final Function(ContactModel) onAddContact;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
    XFile? image;


  Future<void> _pickImage() async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedImage != null && mounted) {
        setState(() {
          image = pickedImage;
        });
      }
    } catch (e) {
      debugPrint('Image picker error: $e');
    }
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String nameText = nameController.text.trim().isEmpty
        ? "User Name"
        : nameController.text;
    final String emailText = emailController.text.trim().isEmpty
        ? "example@email.com"
        : emailController.text;
    final String phoneText = phoneController.text.trim().isEmpty
        ? "+200000000000"
        : phoneController.text;
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom+16
      ),
      child: Column(
        mainAxisSize: .min,
        mainAxisAlignment: .center,
        spacing: 25,
        children: [
          Row(
            spacing: 20,
            children: [
              Container(
                width: 145,
                height: 145,
                clipBehavior: .antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadiusGeometry.circular(28),
                  border: Border.all(color: AppColors.gold, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: _pickImage,
                    child:image==null?const Icon(
                      Icons.add_a_photo,
                      size: 60,
                      color: Colors.white,
                    ):Image.file(File(image!.path,),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,),
                  ),
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 10,
                  children: [
                    Text(
                      nameText,
                      style: TextStyle(
                        fontWeight: .w500,
                        fontSize: 16,
                        color: AppColors.gold,
                      ),
                    ),
                    Divider(color: AppColors.gold, thickness: 1, endIndent: 25),
                    Text(
                      emailText,
                      style: TextStyle(
                        fontWeight: .w500,
                        fontSize: 16,
                        color: AppColors.gold,
                      ),
                    ),
                    Divider(color: AppColors.gold, thickness: 1, endIndent: 25),
                    Text(
                      phoneText,
                      style: TextStyle(
                        fontWeight: .w500,
                        fontSize: 16,
                        color: AppColors.gold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Form(
            key: formKey,
            child: Column(
              spacing: 18,
              children: [
                CustomTextFormField(
                  borderRadius: BorderRadius.circular(16),
                  hintText: "Enter User Name",
                  controller: nameController,
                  validator: Validator.validateName,
                  onChanged: (p0) => setState(() {}),
                ),
                CustomTextFormField(
                  borderRadius: BorderRadius.circular(16),
                  hintText: "Enter User email",
                  controller: emailController,
                  validator: Validator.validateEmail,
                  onChanged: (p0) => setState(() {}),
                ),
                CustomTextFormField(
                  borderRadius: BorderRadius.circular(16),
                  hintText: "Enter User Number",
                  controller: phoneController,
                  validator: Validator.validatePhoneNumber,
                  onChanged: (p0) => setState(() {}),
                ),
                ReusableButton(
                  bgColor: AppColors.gold,
                  text: "Enter User",
                  textColor: AppColors.darkBlue,
                  horizontalPadding: 120,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ContactModel newContact = ContactModel(
                        phone: phoneController.text.trim(),
                        email: emailController.text.trim(),
                        name: nameController.text.trim(),
                        imagePath: image?.path ?? "assets/images/messi.png",
                      );
                      widget.onAddContact(newContact);
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
