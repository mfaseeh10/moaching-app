part of'repository.dart';

class WorkoutRepository {
  WorkoutRepository();

  Future<List<Workout>> getWorkoutByUser(userid) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "v2/workout?userid="+userid);

    print(url);
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization':"Bearer ${Storage.getValue("access_token")}",

    };
    List<Workout> data = [];
    await http.get(url, headers: headers).then((response) {
      if (response.statusCode == 200) {

        final json = jsonDecode(response.body);


         data = json.map<Workout>((model) => Workout.fromJson(model)).toList();



      } else if (response.statusCode == 422) {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });

    return data;
  }

  Future<Workout> getWorkoutById({required String workoutId}) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "v2/workout/"+workoutId);

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization':"Bearer ${Storage.getValue("access_token")}",
    };
    Workout data = Workout.empty();
    await http.get(url, headers: headers).then((response) {

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        data = Workout.fromJson(json);
      } else  {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });

    return data;
  }

  Future<dynamic> createWorkout(Workout workout) async {

    var result;
    late final Uri url;

    String body = json.encode(workout.toJsonCreate());



    url = Uri.parse(ConstantPath.baseurl + "v2/workout");
    print(url);

    Map<String,String>? headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization':"Bearer ${Storage.getValue("access_token")}",
    };

    await http.post(url,body: body, headers: headers).then((response) {

      if (response.statusCode == 204) {
        result ="true";

      } else {
        var json = jsonDecode(response.body);
        result = json['message'];
      }

    });


    return result != "" ? result : null;
  }

  Future<dynamic> updateWorkout(Workout workout) async {
    var result;
    late final Uri url;


    String body = json.encode(workout.toJson());
    log(body);

    url = Uri.parse(ConstantPath.baseurl + "v2/workout/"+workout.id);


    print(url);
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization':"Bearer ${Storage.getValue("access_token")}",
    };
    await http.post(url,body: body, headers: headers).then((response) {

      print(response.statusCode);
      if (response.statusCode == 204) {
       log(response.body);

      } else {
        // var json = jsonDecode(response.body);
        result = "error";
      }
    });
    return result != "" ? result : null;
  }

  Future<dynamic> deleteWorkout(workoutid) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "v2/workout/"+workoutid);

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization':"Bearer ${Storage.getValue("access_token")}",

    };
    await http.delete(url, headers: headers).then((response) {

      if (response.statusCode == 204) {
        print(response.body);
        print(response.statusCode);

      } else if (response.statusCode == 422) {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });
    return result != "" ? result : null;
  }

  Future<dynamic> updateExerciseNote(workoutid,note) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "workout/"+workoutid+"/updateexercisenote");
    var request = {
      "note": note
    };

    var body = json.encode(request);
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    await http.post(url,body:body, headers: headers).then((response) {

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

      } else if (response.statusCode == 422) {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });
    return result != "" ? result : null;
  }

  Future<dynamic> archieveWorkout(workoutid) async {
    var result;
    late final Uri url;

    url = Uri.parse(ConstantPath.baseurl + "workout/archive/"+workoutid);

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
