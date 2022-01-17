import 'package:geolocator/geolocator.dart';
import 'package:taxiflutter/config_map.dart';
import 'package:dio/dio.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(Position position) async {
    String Placeaddress = "";
    Dio dio = Dio(); //initilize dio package
    String apiurl =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    Response response = await dio.get(apiurl); //send get request to API URL

    if (response.statusCode == 200) {
      //if connection is successful
      Map data = response.data; //get response data
      if (data["status"] == "OK") {
        //if status is "OK" returned from REST API
        if (data["results"].length > 0) {
          //if there is atleast one address
          Map firstresult = data["results"][0]; //select the first address

          Placeaddress = firstresult["formatted_address"]; //get the address

          //you can use the JSON data to get address in your own format

        }
      } else {
        print(data["error_message"]);
      }
    } else {
      print("error while fetching geoconding data");
    }
    print("Your Place Address"+Placeaddress);
    return Placeaddress;
  }
}
