part of 'repository.dart';

class UserRepository {
  UserRepository();

  Future<dynamic> signInWithCredentials(
      {required String email, required String password}) async {
    var result;
    late final Uri url;
    url = Uri.parse(ConstantPath.baseurl + "v1/auth/password");

    var request = {
      "email": email,
      "password": password,
    };
    var body = json.encode(request);
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    await http.post(url, body: body, headers: headers).then((response) {

      if (response.statusCode == 200) {
        Storage.setValue('access_token', response.body);
        var payload = Jwt.parseJwt(response.body);
        Storage.setValue('access_token', response.body);
        Storage.setValue('user_info', json.encode(payload));
        result = "true";
        print(Storage.getValue("access_token"));
      } else if (response.statusCode == 400) {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });
    return result != "" ? result : null;
  }

  Future<dynamic> faceBookLogin() async {
    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
    } else {

    }
  }

  Future<dynamic> appleLogin() async {
    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {

      final userData = await FacebookAuth.instance.getUserData();
    } else {

    }
  }

  //Sign Up Function
  Future<dynamic> createUser(UserModel userModel) async {
    var result;
    late final Uri url;
    url = Uri.parse(ConstantPath.baseurl + "v2/user");

    String body = json.encode(userModel.toJson());

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    await http.post(url, body: body, headers: headers).then((response) {
      if (response.statusCode == 204) {
        result = "true";
      } else if (response.statusCode == 422) {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });
    return result != "" ? result : null;
  }

//Reset Password

  Future<dynamic> resetPassword(String email) async {
    var result;
    late final Uri url;
    url = Uri.parse(ConstantPath.baseurl + "v2/user/resetpassword");
    Map<String , dynamic> emailMap = {
      "Email":email
    };
    var body = json.encode(emailMap);
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    await http.post(url, body: body, headers: headers).then((response) {

      if (response.statusCode == 204) {
        result = "true";
      } else {
        var json = jsonDecode(response.body);
        result = json['message'];
      }
    });
    return result != "" ? result : false;
  }
}
