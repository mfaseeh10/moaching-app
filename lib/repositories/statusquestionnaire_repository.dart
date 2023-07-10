import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:moaching_app/constants/constant_paths.dart';

class StatRepository {
  StatRepository();

  Future<dynamic> getStatusQuestionnairies(userId) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "StatusQuestionnaire/"+userId);

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    await http.get(url, headers: headers).then((response) {
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
      } else if (response.statusCode == 422) {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });
    return result != "" ? result : null;
  }
}
