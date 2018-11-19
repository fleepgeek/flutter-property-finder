import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'nestoria.g.dart';


abstract class Nestoria implements Built<Nestoria, NestoriaBuilder> {
  static Serializer<Nestoria> get serializer => _$nestoriaSerializer;

  Response get response;

  Nestoria._();
  factory Nestoria([updates(NestoriaBuilder b)]) = _$Nestoria;
}


abstract class Response implements Built<Response, ResponseBuilder> {
  static Serializer<Response> get serializer => _$responseSerializer;

  BuiltList<Property> get listings;

  Response._();
  factory Response([updates(ResponseBuilder b)]) = _$Response;
}


abstract class Property implements Built<Property, PropertyBuilder> {
  static Serializer<Property> get serializer => _$propertySerializer;

  String get title;

  String get summary;

  Property._();
  factory Property([updates(PropertyBuilder b)]) = _$Property;
}