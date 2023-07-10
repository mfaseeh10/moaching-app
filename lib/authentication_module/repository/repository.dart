import 'dart:convert';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:moaching_app/authentication_module/model/model.dart';
import 'package:moaching_app/constants/constant_paths.dart';
import 'package:moaching_app/utils/storage.dart';

part 'user_repository.dart';