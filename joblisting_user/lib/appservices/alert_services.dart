import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/services/AuthLocalDataSource.dart';

class AlertServices {
  static final AlertServices _instance = AlertServices._internal();

  factory AlertServices() {
    return _instance;
  }

  AlertServices._internal();

  Future<Map<String, bool>> fetchAlertSettings() async {
    final res = await AuthLocalDataSource().getLocalAuthDetails();
    String token = res!.jwtToken;
    final headers = {
      'Authorization': 'Bearer $token',
    };
    print(res.jwtToken);
    final response = await http.get(
      Uri.parse(EndPoints.GetAlertSetting),
      headers: headers,
    );
      print(response.body);
    if (response.statusCode == 200) {


      final decodedResponse = jsonDecode(response.body);
      final alerts = decodedResponse['alerts'] as Map<String, dynamic>;
      return alerts.map((key, value) => MapEntry(key, value as bool));
    } else {
      throw Exception('Failed to load alert settings');
    }
  }

   Future<void> updateAlertSettings(Map<String, bool> settings) async {
    final res = await AuthLocalDataSource().getLocalAuthDetails();
    String token = res!.jwtToken;
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode(settings);

    final response = await http.post(
      Uri.parse(EndPoints.UpdateAlertSetting),
      headers: headers,
      body: body,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update alert settings');
    }
  }
}
