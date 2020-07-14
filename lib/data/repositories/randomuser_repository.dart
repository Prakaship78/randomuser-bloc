import 'package:randomuserbloc/data/models/api_result_model.dart';
import 'package:http/http.dart' as http;
import 'package:randomuserbloc/res/strings.dart';
import 'dart:convert';

abstract class RandomUserRepository {
  Future<List<User>> getRandomUser();
}

class RandomUserImpl implements RandomUserRepository {
  @override
  Future<List<User>> getRandomUser() async {
    var response = await http.get(AppString.randomUserUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data = data['results'];
      // print(data);

      List<User> results = [];
      for (var u in data) {
        User user = User(u['gender'], u['email']);
        results.add(user);
      }

      // print(results);

      return results;
    } else {
      throw Exception();
    }
  }
}
