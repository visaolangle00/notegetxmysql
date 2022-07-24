import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notegetxmysql/data/src/colors.dart';
import 'package:notegetxmysql/data/src/images.dart';
import 'package:notegetxmysql/data/src/strings.dart';
import 'package:notegetxmysql/views/add_notes/add_notes_page.dart';

import 'package:notegetxmysql/views/home/home_controller.dart';
import 'package:notegetxmysql/views/info/info_page.dart';
import 'package:notegetxmysql/views/login/login_page.dart';
import 'package:notegetxmysql/views/profile/profile_page.dart';
import 'package:notegetxmysql/views/search/search_page.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/views/home/home_page';

  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) => _errorDialog());

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
      onPressed: () => _goToAddNotePage(),
      child: Icon(Icons.add),
      backgroundColor: mainColor,
    );
  }

  Widget _buildBody() {
    return Obx(
          () => ListView.builder(
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: _buildCard(
            controller.notesTitle.value?[index] ?? "",
            controller.notesDescription.value?[index] ?? "",
            controller.notesDate.value?[index].toString() ?? "",
          ),
        ),
        itemCount: controller.notesTitle.value?.length ?? 0,
      ),
    );
  }

  Widget _buildCard(
      String title,
      String description,
      String date,
      ) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(20.0), child: _buildCardColumn(title, description, date)),
    );
  }

  Widget _buildCardColumn(
      String title,
      String description,
      String date,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Divider(),
        _buildSpace(),
        Text(
          description,
        ),
        _buildSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              date,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSpace() {
    return SizedBox(
      height: 10,
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
          _buildTitle(searchAppBarText, Icons.search, _goToSearchPage),
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
    Get.toNamed(ProfilePage.routeName);
  }

  void _goToInfo() {
    Get.toNamed(InfoPage.routeName);
  }

  void _goToLogout() {
    Get.offNamedUntil(LoginPage.routeName, (route) => false);
  }

  void _goToAddNotePage() {
    Get.toNamed(AddNotesPage.routeName);
  }

  void _goToSearchPage() {
    Get.toNamed(SearchPage.routeName);
  }

  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: red,
    );
  }
}