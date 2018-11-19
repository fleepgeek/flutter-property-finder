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

  @nullable
  BuiltList<Property> get listings;

  @BuiltValueField(wireName: 'total_results')
  int get totalResults;

  Response._();
  factory Response([updates(ResponseBuilder b)]) = _$Response;
}

abstract class Property implements Built<Property, PropertyBuilder> {
  static Serializer<Property> get serializer => _$propertySerializer;

  String get title;

  String get summary;

  @BuiltValueField(wireName: 'thumb_url')
  String get thumbUrl;

  @BuiltValueField(wireName: 'img_url')
  String get imgUrl;

//  @nullable
//  @BuiltValueField(wireName: 'bathroom_number')
//  int get bathroomNumber;

//  @nullable
//  @BuiltValueField(wireName: 'bedroom_number')
//  int get bedroomNumber;

  @BuiltValueField(wireName: 'car_spaces')
  int get carSpaces;

  @BuiltValueField(wireName: 'price_formatted')
  String get priceFormatted;

  @nullable
  @BuiltValueField(wireName: 'property_type')
  String get propertyType;

  @nullable
  String get keywords;

//  @memoized
//  BuiltList<String> get keyWordList => BuiltList<String>(keywords.split(", "));

  @nullable
  @BuiltValueField(wireName: 'lister_name')
  String get listerName;

  @nullable
  @BuiltValueField(wireName: 'lister_url')
  String get listerUrl;

  @nullable
  @BuiltValueField(wireName: 'datasource_name')
  String get datasourceName;

  @nullable
  @BuiltValueField(wireName: 'updated_in_days')
  int get updatedDays;

  Property._();
  factory Property([updates(PropertyBuilder b)]) = _$Property;
}
