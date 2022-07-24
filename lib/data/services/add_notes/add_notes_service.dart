
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:notegetxmysql/data/services/add_notes/model/add_notes_response_model.dart';

import '../dio_manager.dart';
import 'model/add_notes_request_model.dart';


abstract class AddNotesService {
  Future addNotes(AddNotesRequestModel addNotesRequestModel);
}

class AddNotesServiceImp extends AddNotesService {
  @override
  Future addNotes(AddNotesRequestModel addNotesRequestModel) async {
    const String _baseUrl = 'http://192.168.1.4/flutter/flutter_notegetx_mini/add_notes.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: addNotesRequestModel.toJson());

    if (response.statusCode == 200) {
      print('Not ekleme başarılı');
      return addNotesResponseModelFromJson(response.body);
    } else {
      return '';
    }
  }
}