
import 'package:news/packages/packages.dart';

class CountryInfo with ChangeNotifier{

  String _country="au";
  String get country=>_country;

  
  set country(String val){
    _country=val;
    notifyListeners();
  }

  austria(){
    country="au";

  }
}