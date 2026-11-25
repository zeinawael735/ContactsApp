import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_contacts_session4/core/constants/app_assets.dart';

Widget contactImage(String imagePath) {
  if (imagePath.startsWith('assets/')) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
    );
  }

  return Image.file(
    File(imagePath),
    width: double.infinity,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
      return Image.asset(
        AppAssets.messi,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    },
  );
}