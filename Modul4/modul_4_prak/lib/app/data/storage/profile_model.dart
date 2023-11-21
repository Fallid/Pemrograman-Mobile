import 'package:flutter/material.dart';

class ProfileModel {
  final String? profileName;
  final String? bio;
  final String? imagePath;

  ProfileModel(
      {@required this.profileName,
      @required this.bio,
      @required this.imagePath});
}
