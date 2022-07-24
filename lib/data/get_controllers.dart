
import 'package:get/get.dart';
import 'package:notegetxmysql/data/services/dio_manager.dart';
import 'package:notegetxmysql/data/services/register/register_service.dart';
import 'package:notegetxmysql/views/add_notes/add_notes_controller.dart';
import 'package:notegetxmysql/views/home/home_controller.dart';
import 'package:notegetxmysql/views/login/login_controller.dart';
import 'package:notegetxmysql/views/register/register_controller.dart';


Future getControllers() async {
  // Pages

  Get.create(() => LoginController(), permanent: false);
  Get.create(() => RegisterController(Get.find()), permanent: false);
  Get.create(() => HomeController(), permanent: false);
  Get.create(() => AddNotesController(), permanent: false);

  // Services
  Get.lazyPut(() => DioManager(), fenix:  true);

  Get.lazyPut<RegisterService>(() => RegisterServiceImp(Get.find()));
}