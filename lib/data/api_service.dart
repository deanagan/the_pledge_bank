import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Map<String, dynamic>>> fetchAccounts() async {
    // 10.0.2.2 maps to the localhost from the emulator.
    final url = Uri.parse('http://10.0.2.2:5146/api/Accounts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to fetch accounts');
    }
  }
}
