

import 'package:notegetxmysql/views/search/model/search_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:notegetxmysql/views/search/model/search_response_model.dart';

abstract class SearchService {
  Future search(SearchRequestModel searchRequestModel);
}

class SearchServiceImp extends SearchService {
  @override
  Future search(SearchRequestModel searchRequestModel) async {
    const String _baseUrl = 'http://192.168.1.4/flutter/flutter_notegetx_mini/search.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: searchRequestModel.toJson());

    // if (response.statusCode == 200) {
    //   return SearchResponseModelFromJson(response.body);
    // } else {
    //   return '';
    // }

    var noteListTitle = [];

    if (response.statusCode == 200) {
      var data = searchResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        noteListTitle.add(data[i].title);
      }
      return noteListTitle;
    } else {
      return '';
    }
  }
}