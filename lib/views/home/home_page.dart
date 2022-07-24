import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notegetxmysql/data/src/colors.dart';
import 'package:notegetxmysql/data/src/images.dart';
import 'package:notegetxmysql/data/src/strings.dart';
import 'package:notegetxmysql/views/add_notes/add_notes_page.dart';

import 'package:notegetxmysql/views/home/home_controller.dart';
import 'package:notegetxmysql/views/login/login_page.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/views/home/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(homeAppBarText),
          backgroundColor: mainColor,
        ),
        drawer: _buildDrawer(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton());
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      //onPressed: () => _goToBack(),
      onPressed: () => _goToAddNotePage(),
      child: Icon(Icons.add),
      backgroundColor: mainColor,
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: _buildCard(index),
      ),
      itemCount: 5,
    );
  }

  Widget _buildCard(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text('Not $index'),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          _buildTitle(homeAppBarText, Icons.home, _goToBack),
          Divider(),
          _buildTitle(profileText, Icons.person, _goToProfile),
          Divider(),
          _buildTitle(infoText, Icons.info, _goToInfo),
          Divider(),
          _buildTitle(logoutText, Icons.logout, _goToLogout),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text('Kadriye'),
      accountEmail: Text('kadriye@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage(githubLogo),
        backgroundColor: white,
      ),
      decoration: BoxDecoration(color: mainColor),
    );
  }

  Widget _buildTitle(String text, IconData, Function function) {
    return ListTile(
      title: Text(text),
      leading: Icon(
        IconData,
        color: mainColor,
      ),
      onTap: () => function(),
    );
  }

  void _goToBack() {
    Get.back();
  }

  void _goToProfile() {
    Get.back();
  }

  void _goToInfo() {
    Get.back();
  }

  void _goToLogout() {
    Get.offAndToNamed(LoginPage.routeName);
  }

  void _goToAddNotePage() {
    Get.toNamed(AddNotesPage.routeName);
  }
}