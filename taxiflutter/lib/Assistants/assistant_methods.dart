import 'package:geolocator/geolocator.dart';
import 'package:taxiflutter/Assistants/requesassistants.dart';
import 'package:taxiflutter/config_map.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(Position position) async {
    var placeAdderss = "";
    var url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey");
    var response = await RequesrAssistans.getRequest(url);
    if (response != "failed") {
      placeAdderss = response["results"][0]["formatted_address"];
    }

    return placeAdderss;
  }
}
