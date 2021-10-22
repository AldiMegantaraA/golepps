import 'package:golepps/models/login_model.dart';
import 'package:golepps/models/scoreCard_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {

    final response = await http.post(Uri.parse("http://167.172.78.242:8000/api/login/"), body: requestModel.toJson());
    if(response.statusCode == 400 || response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Login');
    }
  }

  Future<ScoreCardResponse> scorecard(ScoreCardRequest requestModel) async {

    final response = await http.post(Uri.parse("http://167.172.78.242:8000/api/post_scoreuser/"), body: requestModel.toJson());
    if(response.statusCode == 400 || response.statusCode == 200) {
      return ScoreCardResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Post Score');
    }
  }
}
