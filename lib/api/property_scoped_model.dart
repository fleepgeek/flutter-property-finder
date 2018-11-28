import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_property_finder/models/nestoria.dart';
import 'package:flutter_property_finder/models/serializers.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class PropertyScopedModel extends Model {
  List<Property> _properties = [];
  bool _isLoading = false;
  String _statusText = "Start Search";
  int _totalResults;
  int _totalPages;
  bool _hasMorePages = true;
  String _placeName;
  bool _isLoadingMore = false;

  List<Map<String, String>> _listingTypeList = [
    {"name": "Buy", "value": "buy"},
    {"name": "Rent", "value": "rent"},
  ];
  String _listingType;
  List<Map<String, String>> _countryList = [
    {"name": "Brazil", "value": "br"},
    {"name": "France", "value": "fr"},
    {"name": "Germany", "value": "de"},
    {"name": "India", "value": "in"},
    {"name": "Italy", "value": "it"},
    {"name": "Mexico", "value": "mx"},
    {"name": "Spain", "value": "es"},
    {"name": "United Kingdom", "value": "uk"},
  ];
  String _country;
  List<Map<String, String>> _sortList = [
    {"name": "Relevancy", "value": "relevancy"},
    {"name": "Bedroom (Ascending)", "value": "bedroom_lowhigh"},
    {"name": "Bedroom (Descending)", "value": "bedroom_highlow"},
    {"name": "Price (Ascending)", "value": "price_lowhigh"},
    {"name": "Price (Descending)", "value": "price_highlow"},
    {"name": "Newest", "value": "newest"},
    {"name": "Oldest", "value": "oldest"},
    {"name": "Random", "value": "random"},
    {"name": "Distance", "value": "distance"}
  ];
  String _sort;

  List<Property> get properties => _properties;
  bool get isLoading => _isLoading;
  String get statusText => _statusText;
  int get totalResults => _totalResults;
  int get totalPages => _totalPages;
  bool get hasMorePages => _hasMorePages;
  String get placeName => _placeName;
  bool get isLoadingMore => _isLoadingMore;

  List<Map<String, String>> get listingTypeList => _listingTypeList;
  String get listingType => _listingType;
  List<Map<String, String>> get countryList => _countryList;
  String get country => _country;
  List<Map<String, String>> get sortList => _sortList;
  String get sort => _sort;

  int getPropertyCount() => _properties.length;

  void initializeValues() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _country = prefs.getString('country') ?? 'uk';
    _listingType = prefs.getString('listingType') ?? 'rent';
    _sort = prefs.getString('sort') ?? 'relevancy';
    notifyListeners();
  }

  Future<dynamic> _getData(String place, [int page = 1]) async {
    String topLevelDomain = _country;
    if(_country == "br"){
      topLevelDomain = "com.$_country";
    }else if(_country == "uk"){
      topLevelDomain = "co.$_country";
    }

    var uri = Uri.https(
      "api.nestoria.$topLevelDomain",
      "/api",
      {
        "encoding": "json",
        "action": "search_listings",
        "has_photo": "1",
        "page": page.toString(),
        "number_of_results": "10",
        "listing_type": _listingType,
        "sort": _sort,
        "place_name": place
      },
    );

    var res = await http.get(uri);

    var decodedJson = json.decode(res.body, reviver: (k, v) {
      if (k == "bathroom_number") {
        if (v == "") return null;
        return v;
      }
      if (k == "bedroom_number") {
        if (v == "") return null;
        return v;
      }
      return v;
    });

    return decodedJson;
  }

  Future getProperties(String place, [int page = 1]) async {
    if (page == 1) {
      _isLoading = true;
      _properties.clear();
    } else {
      _isLoadingMore = true;
    }

    _placeName = place;

    notifyListeners();

    var responseData = await _getData(place, page);

    Nestoria nestoria =
        serializers.deserializeWith(Nestoria.serializer, responseData);

    nestoria.response.listings.forEach((property) {
      _properties.add(property);
    });

    if (nestoria.response.listings.isEmpty) {
      _statusText = "Nothing Found";
    }

    _totalResults = nestoria.response.totalResults;
    _totalPages = nestoria.response.totalPages;

    if (nestoria.response.page == totalPages) {
      _hasMorePages = false;
    }

//    print(nestoria.response.page);

    if (page == 1) {
      _isLoading = false;
    } else {
      _isLoadingMore = false;
    }
    notifyListeners();
  }

  void setCountry(String value) async{
    _country = value;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('country', _country);
  }

  void setListingType(String value) async{
    _listingType = value;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('listingType', _listingType);
  }

  void setSort(String value) async{
    _sort = value;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('sort', _sort);
  }

  /// Wraps [ScopedModel.of] for this [Model].
  static PropertyScopedModel of(BuildContext context) =>
      ScopedModel.of<PropertyScopedModel>(context);
}
