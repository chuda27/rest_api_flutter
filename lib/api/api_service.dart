import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:rest_api_users/api/api_constant.dart';
import 'package:rest_api_users/model/user.dart';

class ApiService {
  Future<List<User>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstant.baseUrl + ApiConstant.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<User> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
