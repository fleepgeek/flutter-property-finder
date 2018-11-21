import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_property_finder/models/nestoria.dart';
import 'package:flutter_property_finder/models/serializers.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:http/http.dart' as http;

class PropertyScopedModel extends Model{
  List<Property> _properties = [];
  bool _isLoading = false;
  String _statusText = "Start Search";
  int _totalResults;
  int _totalPages;
  bool _hasMorePages = true;
  String _placeName;
  bool _isLoadingMore = false;

  List<Property> get properties => _properties;
  bool get isLoading => _isLoading;
  String get statusText => _statusText;
  int get totalResults => _totalResults;
  int get totalPages => _totalPages;
  bool get hasMorePages => _hasMorePages;
  String get placeName => _placeName;
  bool get isLoadingMore => _isLoadingMore;

  int getPropertyCount() => _properties.length;

  Future<dynamic> _getData(String place, [int page = 1]) async{
    var uri = Uri.https(
      "api.nestoria.co.uk",
      "/api",
      {
        "encoding": "json",
        "action": "search_listings",
        "has_photo": "1",
        "page": page.toString(),
        "number_of_results": "10",
        "place_name": place.isNotEmpty ? place : "brighton"
      },
    );

    var res = await http.get(uri);

    var decodedJson = json.decode(res.body, reviver: (k, v){
      if(k == "bathroom_number"){
        if(v == "") return null;
        return v;
      }
      if(k == "bedroom_number"){
        if(v == "") return null;
        return v;
      }
      return v;
    });

    return decodedJson;
  }

  Future getProperties(String place, [int page = 1]) async{
    if(page == 1){
      _isLoading = true;
      _properties.clear();
    }else {
      _isLoadingMore = true;
    }

    _placeName = place;

    notifyListeners();

    var responseData = await _getData(place, page);

    Nestoria nestoria = serializers.deserializeWith(Nestoria.serializer, responseData);

    nestoria.response.listings.forEach((property) {
      _properties.add(property);
    });

    if(nestoria.response.listings.isEmpty){
      _statusText = "Nothing Found";
    }

    _totalResults = nestoria.response.totalResults;
    _totalPages = nestoria.response.totalPages;

    if(nestoria.response.page == totalPages){
      _hasMorePages = false;
    }

    print(nestoria.response.page);

    if(page == 1){
      _isLoading = false;
    }else {
      _isLoadingMore = false;
    }
    notifyListeners();
  }

  /// Wraps [ScopedModel.of] for this [Model].
  static PropertyScopedModel of(BuildContext context) =>
      ScopedModel.of<PropertyScopedModel>(context);
}