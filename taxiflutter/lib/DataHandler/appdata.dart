import 'package:flutter/cupertino.dart';
import 'package:taxiflutter/Models/address.dart';

class AppData extends ChangeNotifier {
   Address? PickUpLocation;
  void updatePickUpLocationAddress(Address PickUpAddress) {
    PickUpLocation = PickUpAddress;
    notifyListeners();
  }
}
