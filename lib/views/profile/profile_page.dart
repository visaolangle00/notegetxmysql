

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:notegetxmysql/data/src/colors.dart';
import 'package:notegetxmysql/data/src/strings.dart';
import 'package:notegetxmysql/views/profile/profile_controller.dart';
import 'package:flutter/material.dart';

class ProfilePage extends GetWidget<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  static const String routeName = '/views/profile/profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(profileAppBarText),
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Text('Profil sayfası'),
      ),
    );
  }
}