import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:moaching_app/constants/constant_paths.dart';

class FoodPlanRepository {
  FoodPlanRepository();

  Future<dynamic> getFoodPlans(userid) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "food/"+"/foodplans");

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

  Future<dynamic> getFoodPlansById(workoutid) async {
    var result;
    late final Uri url;
    url = Uri.parse(ConstantPath.baseurl + "FoodPlan/workout/"+workoutid+"/lastsession");

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

  Future<dynamic> createFoodPlan(workout) async {
    var result;
    late final Uri url;
    var request = {
      "workout":workout
    };

    var body = json.encode(request);
    url = Uri.parse(ConstantPath.baseurl + "/FoodPlan");

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    await http.post(url,body: body, headers: headers).then((response) {
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

  Future<dynamic> deleteFoodPlan(workoutSesId) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "FoodPlan/"+workoutSesId);

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    await http.delete(url, headers: headers).then((response) {
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