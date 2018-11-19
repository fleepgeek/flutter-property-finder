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

  Future<dynamic> _getData(String place) async{
    String uri = "https://api.nestoria.co.uk/api?encoding=json&pretty=1&action=search_listings&has_photo=1&country=uk&listing_type=buy&place_name=$place";
    var res = await http.get(Uri.encodeFull(uri));
    return json.decode(res.body);
  }

  Future getProperties(String place) async{
    _isLoading = true;
    notifyListeners();

    var responseData = await _getData(place);

    Nestoria nestoria = serializers.deserializeWith(Nestoria.serializer, responseData);

    _properties = nestoria.response.listings.map((property) => property).toList();

    _isLoading = false;
    notifyListeners();
  }
}