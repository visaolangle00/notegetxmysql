
import 'package:get/get.dart';
import 'package:notegetxmysql/data/services/add_notes/add_notes_service.dart';
import 'package:notegetxmysql/data/services/dio_manager.dart';
import 'package:notegetxmysql/data/services/home/home_service.dart';
import 'package:notegetxmysql/data/services/login/login_service.dart';
import 'package:notegetxmysql/data/services/register/register_service.dart';
import 'package:notegetxmysql/views/add_notes/add_notes_controller.dart';
import 'package:notegetxmysql/views/home/home_controller.dart';
import 'package:notegetxmysql/views/info/info_controller.dart';
import 'package:notegetxmysql/views/login/login_controller.dart';
import 'package:notegetxmysql/views/profile/profile_controller.dart';
import 'package:notegetxmysql/views/register/register_controller.dart';
import 'package:notegetxmysql/views/search/search_controller.dart';


Future getControllers() async {
  // Pages

  Get.create(() => LoginController(Get.find()), permanent: false);
  Get.create(() => RegisterController(Get.find()), permanent: false);
  //Get.create(() => HomeController(), permanent: false);
  Get.create(() => HomeController(Get.find()), permanent: false);

  Get.create(() => AddNotesController(Get.find()), permanent: false);
  Get.create(() => InfoController(), permanent: false);
  Get.create(() => ProfileController(), permanent: false);
  Get.create(() => SearchController(Get.find()), permanent: false);


  // Services
  //Get.lazyPut(() => DioManager(), fenix:  true);

  Get.lazyPut<RegisterService>(() => RegisterServiceImp());
  Get.lazyPut<LoginService>(() => LoginServiceImp());
  Get.lazyPut<AddNotesService>(() => AddNotesServiceImp());
  Get.lazyPut<HomeService>(() => HomeServiceImp());


}