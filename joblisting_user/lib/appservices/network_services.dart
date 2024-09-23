import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/services/AuthLocalDataSource.dart';

class NetworkConnectionService {
  static final NetworkConnectionService _instance = NetworkConnectionService._internal();

  factory NetworkConnectionService() {
    return _instance;
  }

  NetworkConnectionService._internal();

 Future<Map<String, bool>> fetchNetworkSettings() async {
  try {
    final res = await AuthLocalDataSource().getLocalAuthDetails();
    if (res == null || res.jwtToken == null) {
      throw Exception('No authentication details found');
    }
    String token = res.jwtToken!;
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      Uri.parse(EndPoints.GetNetworkSetting),
      headers: headers,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final networkAlerts = decodedResponse['networkAlerts'] as Map<String, dynamic>?;

      if (networkAlerts == null) {
        throw Exception('Network alerts data is null');
      }

      return networkAlerts.map((key, value) => MapEntry(key, value as bool));
    } else {
      throw Exception('Failed to load network settings. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching network settings: $e');
    rethrow;
  }
}


  Future<void> updateNetworkSettings(Map<String, bool> settings) async {
    final res = await AuthLocalDataSource().getLocalAuthDetails();
    String token = res!.jwtToken;
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode(settings);

    final response = await http.post(
      Uri.parse(EndPoints.UpdateNetworkSetting),
      headers: headers,
      body: body,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update network settings');
    }
  }
}
