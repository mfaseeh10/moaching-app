import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:moaching_app/constants/constant_paths.dart';

class WorkoutSessionRepository {
  WorkoutSessionRepository();

  Future<dynamic> getWorkoutSessions(userid) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "workoutsession?userid="+userid);

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    await http.get(url, headers: headers).then((response) {

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
      } else if (response.statusCode == 422) {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });
    return result != "" ? result : null;
  }

  Future<dynamic> getWorkoutSessionsById(workoutid) async {
    var result;
    late final Uri url;
    url = Uri.parse(ConstantPath.baseurl + "workoutsession/workout/"+workoutid+"/lastsession");

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    await http.get(url, headers: headers).then((response) {

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
      } else if (response.statusCode == 422) {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });
    return result != "" ? result : null;
  }

  Future<dynamic> createWorkoutSession(workout) async {
    var result;
    late final Uri url;
    var request = {
      "workout":workout
    };

    var body = json.encode(request);
    url = Uri.parse(ConstantPath.baseurl + "/workoutsession");

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    await http.post(url,body: body, headers: headers).then((response) {

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

      } else if (response.statusCode == 422) {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });
    return result != "" ? result : null;
  }

  Future<dynamic> deleteWorkoutSession(workoutSesId) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "workoutsession/"+workoutSesId);

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    await http.delete(url, headers: headers).then((response) {

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

      } else if (response.statusCode == 422) {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });
    return result != "" ? result : null;
  }
}
