import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:notegetxmysql/data/src/colors.dart';
import 'package:notegetxmysql/data/src/images.dart';
import 'package:notegetxmysql/data/src/strings.dart';

import 'package:notegetxmysql/views/login/login_controller.dart';
import 'package:notegetxmysql/views/register/register_page.dart';

class LoginPage extends GetWidget<LoginController> {
  static const String routeName = '/views/login/login_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(loginAppBarText),
          backgroundColor: mainColor,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSpace(),
            _buildImage(),
            _buildMaxSpace(),
            _buildUsernameTextField(),
            _buildSpace(),
            _buildPasswordTextField(),
            _buildMaxSpace(),
            _buildButton(),
            _buildSpace(),
            _buildRegisterText()
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      githubLogo,
      height: Get.height * .3,
    );
  }

  Widget _buildUsernameTextField() {
    return Material(
      elevation: 10,
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(300),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          textInputAction: TextInputAction.next,
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: usernameText,
          ),
          controller: controller.usernameController,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Material(
      elevation: 10,
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(300),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: passwordText,
          ),
          controller: controller.passwordControler,
        ),
      ),
    );
  }

  Widget _buildButton() {
    final double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
          onPressed: () {},
          child: Text(loginButton),
          style: ElevatedButton.styleFrom(
            primary: mainColor,
          )),
    );
  }

  Widget _buildSpace() {
    return SizedBox(
      height: 20,
    );
  }

  Widget _buildMaxSpace() {
    return SizedBox(
      height: 40,
    );
  }

  Widget _buildRegisterText() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: registerQuestionText,
            style: TextStyle(color: black),
          ),
          TextSpan(
              text: registerButtonText,
              style: TextStyle(color: black, fontStyle: FontStyle.italic),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offNamed(RegisterPage.routeName);
                }),
        ]));
  }
}
