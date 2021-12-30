import 'dart:convert';

import 'package:http/http.dart' as http;

class RequesrAssistans {
  static Future<dynamic> getRequest(url) async {
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        String jsonData = response.body;
        var decodeData = jsonDecode(jsonData);
      } else {
        return "No respons";
      }
    } catch (e) {
      return "No respons";
    }
  }
}
