
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:notegetxmysql/views/add_notes/add_notes_page.dart';
import 'package:notegetxmysql/views/home/home_page.dart';
import 'package:notegetxmysql/views/info/info_page.dart';
import 'package:notegetxmysql/views/login/login_page.dart';
import 'package:notegetxmysql/views/profile/profile_page.dart';
import 'package:notegetxmysql/views/register/register_page.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
  GetPage(name: LoginPage.routeName, page: () => LoginPage()),
  GetPage(name: RegisterPage.routeName, page: () => RegisterPage()),
  GetPage(name: HomePage.routeName, page: () => HomePage()),
  GetPage(name: AddNotesPage.routeName, page: () => AddNotesPage()),

  GetPage(name: InfoPage.routeName, page: () => InfoPage()),
  GetPage(name: ProfilePage.routeName, page: () => ProfilePage()),
];