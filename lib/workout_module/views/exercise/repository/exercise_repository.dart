import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:moaching_app/constants/constant_paths.dart';
import 'package:moaching_app/utils/storage.dart';
import 'package:moaching_app/workout_module/views/exercise/model/model.dart';

class ExerciseRepository {
  ExerciseRepository();

  Future<dynamic> getEquipments() async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "exercise/equipment");
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

  Future<dynamic> getExerciseByKey(exercisekey) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "v2/exercise/"+exercisekey);

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

  Future<List<Exercise>> searchExercise(String query) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "v2/exercise/search?$query");


    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization':"Bearer ${Storage.getValue("access_token")}",

    };
    List<Exercise> data = [];

    await http.get(url, headers: headers).then((response) {
      if (response.statusCode == 200) {

        var json = jsonDecode(response.body);

        data = json.map<Exercise>((model) =>Exercise.fromJson(model)).toList();

      } else if (response.statusCode == 422) {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });
    return data;
  }

  Future<dynamic> getExercises() async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "Exercise?userid=");

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

  Future<dynamic> getExerciseById(ExerciseId) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "Exercise/"+ExerciseId);

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

  Future<dynamic> deleteExercise(ExerciseId) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "Exercise/"+ExerciseId);

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

  Future<dynamic> updateExerciseNote(ExerciseId,note) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "Exercise/"+ExerciseId+"/UpdateExerciseNote");
    var body = json.encode({"note":note});

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    await http.post(url, headers: headers,body: body).then((response) {

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
      } else if (response.statusCode == 422) {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });
    return result != "" ? result : null;
  }

  Future<dynamic> archieveExercise(ExerciseId) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "Exercise/archieve/"+ExerciseId);

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    await http.post(url, headers: headers).then((response) {

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
