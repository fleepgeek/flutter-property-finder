import 'dart:convert';
import 'package:flutter_property_finder/models/nestoria.dart';
import 'package:flutter_property_finder/models/serializers.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:http/http.dart' as http;

class PropertyScopedModel extends Model{
  List<Property> _properties = [];
  List<Property> get properties => _properties;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<dynamic> getData() async{
    String uri = "https://api.nestoria.co.uk/api?encoding=json&pretty=1&action=search_listings&country=uk&listing_type=buy&place_name=brighton";
    var res = await http.get(Uri.encodeFull(uri));
    return json.decode(res.body);
  }

  Future getProperties() async{
    _isLoading = true;
    notifyListeners();

    var responseData = await getData();

    Nestoria nestoria = serializers.deserializeWith(Nestoria.serializer, responseData);

    _properties = nestoria.response.listings.map((property) => property).toList();
    
    _isLoading = false;
    notifyListeners();
  }
}