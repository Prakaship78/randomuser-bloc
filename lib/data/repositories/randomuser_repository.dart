import 'package:randomuserbloc/data/models/api_result_model.dart';
import 'package:http/http.dart' as http;
import 'package:randomuserbloc/res/strings.dart';
import 'dart:convert';

abstract class RandomUserRepository {
  Future<List<Results>> getRandomUser();
}

class RandomUserImpl implements RandomUserRepository {
  @override
  Future<List<Results>> getRandomUser() async {
    var response = await http.get(AppString.randomUserUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);

      List<Results> results = ApiResultModel.fromJson(data).results;

      return results;
    } else {
      throw Exception();
    }
  }
}
