import 'package:http/http.dart' as http;

class API_Manager {
  Future<http.Response> getData(url, data) async {
    var client = http.Client();

    var login = null;

    try {
      var response = await client.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);

      print(response.body);
      return response;
      // if (response.statusCode == 200) {
      //   var jsonString = response.body;
      //   var jsonMap = jsonDecode(jsonString);
      //   welcome = WelcomeNew.fromJson(jsonMap);
      // }
    } catch (e) {
      print(e);
      // return welcome;
    }
    return login;
  }
}

