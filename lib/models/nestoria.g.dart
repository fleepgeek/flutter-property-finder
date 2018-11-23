// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nestoria.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<Nestoria> _$nestoriaSerializer = new _$NestoriaSerializer();
Serializer<Response> _$responseSerializer = new _$ResponseSerializer();
Serializer<Property> _$propertySerializer = new _$PropertySerializer();

class _$NestoriaSerializer implements StructuredSerializer<Nestoria> {
  @override
  final Iterable<Type> types = const [Nestoria, _$Nestoria];
  @override
  final String wireName = 'Nestoria';

  @override
  Iterable serialize(Serializers serializers, Nestoria object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'response',
      serializers.serialize(object.response,
          specifiedType: const FullType(Response)),
    ];

    return result;
  }

  @override
  Nestoria deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NestoriaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'response':
          result.response.replace(serializers.deserialize(value,
              specifiedType: const FullType(Response)) as Response);
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseSerializer implements StructuredSerializer<Response> {
  @override
  final Iterable<Type> types = const [Response, _$Response];
  @override
  final String wireName = 'Response';

  @override
  Iterable serialize(Serializers serializers, Response object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'total_results',
      serializers.serialize(object.totalResults,
          specifiedType: const FullType(int)),
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'total_pages',
      serializers.serialize(object.totalPages,
          specifiedType: const FullType(int)),
    ];
    if (object.listings != null) {
      result
        ..add('listings')
        ..add(serializers.serialize(object.listings,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Property)])));
    }

    return result;
  }

  @override
  Response deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'listings':
          result.listings.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Property)])) as BuiltList);
          break;
        case 'total_results':
          result.totalResults = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_pages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PropertySerializer implements StructuredSerializer<Property> {
  @override
  final Iterable<Type> types = const [Property, _$Property];
  @override
  final String wireName = 'Property';

  @override
  Iterable serialize(Serializers serializers, Property object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'summary',
      serializers.serialize(object.summary,
          specifiedType: const FullType(String)),
      'thumb_url',
      serializers.serialize(object.thumbUrl,
          specifiedType: const FullType(String)),
      'img_url',
      serializers.serialize(object.imgUrl,
          specifiedType: const FullType(String)),
      'car_spaces',
      serializers.serialize(object.carSpaces,
          specifiedType: const FullType(int)),
      'price_formatted',
      serializers.serialize(object.priceFormatted,
          specifiedType: const FullType(String)),
    ];
    if (object.bathroomNumber != null) {
      result
        ..add('bathroom_number')
        ..add(serializers.serialize(object.bathroomNumber,
            specifiedType: const FullType(int)));
    }
    if (object.bedroomNumber != null) {
      result
        ..add('bedroom_number')
        ..add(serializers.serialize(object.bedroomNumber,
            specifiedType: const FullType(int)));
    }
    if (object.propertyType != null) {
      result
        ..add('property_type')
        ..add(serializers.serialize(object.propertyType,
            specifiedType: const FullType(String)));
    }
    if (object.keywords != null) {
      result
        ..add('keywords')
        ..add(serializers.serialize(object.keywords,
            specifiedType: const FullType(String)));
    }
    if (object.listerName != null) {
      result
        ..add('lister_name')
        ..add(serializers.serialize(object.listerName,
            specifiedType: const FullType(String)));
    }
    if (object.listerUrl != null) {
      result
        ..add('lister_url')
        ..add(serializers.serialize(object.listerUrl,
            specifiedType: const FullType(String)));
    }
    if (object.datasourceName != null) {
      result
        ..add('datasource_name')
        ..add(serializers.serialize(object.datasourceName,
            specifiedType: const FullType(String)));
    }
    if (object.updatedDays != null) {
      result
        ..add('updated_in_days')
        ..add(serializers.serialize(object.updatedDays,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  Property deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PropertyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'summary':
          result.summary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumb_url':
          result.thumbUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'img_url':
          result.imgUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bathroom_number':
          result.bathroomNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'bedroom_number':
          result.bedroomNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'car_spaces':
          result.carSpaces = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'price_formatted':
          result.priceFormatted = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'property_type':
          result.propertyType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'keywords':
          result.keywords = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lister_name':
          result.listerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lister_url':
          result.listerUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'datasource_name':
          result.datasourceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updated_in_days':
          result.updatedDays = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Nestoria extends Nestoria {
  @override
  final Response response;

  factory _$Nestoria([void updates(NestoriaBuilder b)]) =>
      (new NestoriaBuilder()..update(updates)).build();

  _$Nestoria._({this.response}) : super._() {
    if (response == null) {
      throw new BuiltValueNullFieldError('Nestoria', 'response');
    }
  }

  @override
  Nestoria rebuild(void updates(NestoriaBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NestoriaBuilder toBuilder() => new NestoriaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Nestoria && response == other.response;
  }

  @override
  int get hashCode {
    return $jf($jc(0, response.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Nestoria')..add('response', response))
        .toString();
  }
}

class NestoriaBuilder implements Builder<Nestoria, NestoriaBuilder> {
  _$Nestoria _$v;

  ResponseBuilder _response;
  ResponseBuilder get response => _$this._response ??= new ResponseBuilder();
  set response(ResponseBuilder response) => _$this._response = response;

  NestoriaBuilder();

  NestoriaBuilder get _$this {
    if (_$v != null) {
      _response = _$v.response?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Nestoria other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Nestoria;
  }

  @override
  void update(void updates(NestoriaBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Nestoria build() {
    _$Nestoria _$result;
    try {
      _$result = _$v ?? new _$Nestoria._(response: response.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'response';
        response.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Nestoria', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Response extends Response {
  @override
  final BuiltList<Property> listings;
  @override
  final int totalResults;
  @override
  final int page;
  @override
  final int totalPages;

  factory _$Response([void updates(ResponseBuilder b)]) =>
      (new ResponseBuilder()..update(updates)).build();

  _$Response._({this.listings, this.totalResults, this.page, this.totalPages})
      : super._() {
    if (totalResults == null) {
      throw new BuiltValueNullFieldError('Response', 'totalResults');
    }
    if (page == null) {
      throw new BuiltValueNullFieldError('Response', 'page');
    }
    if (totalPages == null) {
      throw new BuiltValueNullFieldError('Response', 'totalPages');
    }
  }

  @override
  Response rebuild(void updates(ResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseBuilder toBuilder() => new ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Response &&
        listings == other.listings &&
        totalResults == other.totalResults &&
        page == other.page &&
        totalPages == other.totalPages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, listings.hashCode), totalResults.hashCode),
            page.hashCode),
        totalPages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Response')
          ..add('listings', listings)
          ..add('totalResults', totalResults)
          ..add('page', page)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class ResponseBuilder implements Builder<Response, ResponseBuilder> {
  _$Response _$v;

  ListBuilder<Property> _listings;
  ListBuilder<Property> get listings =>
      _$this._listings ??= new ListBuilder<Property>();
  set listings(ListBuilder<Property> listings) => _$this._listings = listings;

  int _totalResults;
  int get totalResults => _$this._totalResults;
  set totalResults(int totalResults) => _$this._totalResults = totalResults;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  int _totalPages;
  int get totalPages => _$this._totalPages;
  set totalPages(int totalPages) => _$this._totalPages = totalPages;

  ResponseBuilder();

  ResponseBuilder get _$this {
    if (_$v != null) {
      _listings = _$v.listings?.toBuilder();
      _totalResults = _$v.totalResults;
      _page = _$v.page;
      _totalPages = _$v.totalPages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Response other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Response;
  }

  @override
  void update(void updates(ResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Response build() {
    _$Response _$result;
    try {
      _$result = _$v ??
          new _$Response._(
              listings: _listings?.build(),
              totalResults: totalResults,
              page: page,
              totalPages: totalPages);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'listings';
        _listings?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Response', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Property extends Property {
  @override
  final String title;
  @override
  final String summary;
  @override
  final String thumbUrl;
  @override
  final String imgUrl;
  @override
  final int bathroomNumber;
  @override
  final int bedroomNumber;
  @override
  final int carSpaces;
  @override
  final String priceFormatted;
  @override
  final String propertyType;
  @override
  final String keywords;
  @override
  final String listerName;
  @override
  final String listerUrl;
  @override
  final String datasourceName;
  @override
  final int updatedDays;
  BuiltList<String> __keyWordList;

  factory _$Property([void updates(PropertyBuilder b)]) =>
      (new PropertyBuilder()..update(updates)).build();

  _$Property._(
      {this.title,
      this.summary,
      this.thumbUrl,
      this.imgUrl,
      this.bathroomNumber,
      this.bedroomNumber,
      this.carSpaces,
      this.priceFormatted,
      this.propertyType,
      this.keywords,
      this.listerName,
      this.listerUrl,
      this.datasourceName,
      this.updatedDays})
      : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('Property', 'title');
    }
    if (summary == null) {
      throw new BuiltValueNullFieldError('Property', 'summary');
    }
    if (thumbUrl == null) {
      throw new BuiltValueNullFieldError('Property', 'thumbUrl');
    }
    if (imgUrl == null) {
      throw new BuiltValueNullFieldError('Property', 'imgUrl');
    }
    if (carSpaces == null) {
      throw new BuiltValueNullFieldError('Property', 'carSpaces');
    }
    if (priceFormatted == null) {
      throw new BuiltValueNullFieldError('Property', 'priceFormatted');
    }
  }

  @override
  BuiltList<String> get keyWordList => __keyWordList ??= super.keyWordList;

  @override
  Property rebuild(void updates(PropertyBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PropertyBuilder toBuilder() => new PropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Property &&
        title == other.title &&
        summary == other.summary &&
        thumbUrl == other.thumbUrl &&
        imgUrl == other.imgUrl &&
        bathroomNumber == other.bathroomNumber &&
        bedroomNumber == other.bedroomNumber &&
        carSpaces == other.carSpaces &&
        priceFormatted == other.priceFormatted &&
        propertyType == other.propertyType &&
        keywords == other.keywords &&
        listerName == other.listerName &&
        listerUrl == other.listerUrl &&
        datasourceName == other.datasourceName &&
        updatedDays == other.updatedDays;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, title.hashCode),
                                                        summary.hashCode),
                                                    thumbUrl.hashCode),
                                                imgUrl.hashCode),
                                            bathroomNumber.hashCode),
                                        bedroomNumber.hashCode),
                                    carSpaces.hashCode),
                                priceFormatted.hashCode),
                            propertyType.hashCode),
                        keywords.hashCode),
                    listerName.hashCode),
                listerUrl.hashCode),
            datasourceName.hashCode),
        updatedDays.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Property')
          ..add('title', title)
          ..add('summary', summary)
          ..add('thumbUrl', thumbUrl)
          ..add('imgUrl', imgUrl)
          ..add('bathroomNumber', bathroomNumber)
          ..add('bedroomNumber', bedroomNumber)
          ..add('carSpaces', carSpaces)
          ..add('priceFormatted', priceFormatted)
          ..add('propertyType', propertyType)
          ..add('keywords', keywords)
          ..add('listerName', listerName)
          ..add('listerUrl', listerUrl)
          ..add('datasourceName', datasourceName)
          ..add('updatedDays', updatedDays))
        .toString();
  }
}

class PropertyBuilder implements Builder<Property, PropertyBuilder> {
  _$Property _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _summary;
  String get summary => _$this._summary;
  set summary(String summary) => _$this._summary = summary;

  String _thumbUrl;
  String get thumbUrl => _$this._thumbUrl;
  set thumbUrl(String thumbUrl) => _$this._thumbUrl = thumbUrl;

  String _imgUrl;
  String get imgUrl => _$this._imgUrl;
  set imgUrl(String imgUrl) => _$this._imgUrl = imgUrl;

  int _bathroomNumber;
  int get bathroomNumber => _$this._bathroomNumber;
  set bathroomNumber(int bathroomNumber) =>
      _$this._bathroomNumber = bathroomNumber;

  int _bedroomNumber;
  int get bedroomNumber => _$this._bedroomNumber;
  set bedroomNumber(int bedroomNumber) => _$this._bedroomNumber = bedroomNumber;

  int _carSpaces;
  int get carSpaces => _$this._carSpaces;
  set carSpaces(int carSpaces) => _$this._carSpaces = carSpaces;

  String _priceFormatted;
  String get priceFormatted => _$this._priceFormatted;
  set priceFormatted(String priceFormatted) =>
      _$this._priceFormatted = priceFormatted;

  String _propertyType;
  String get propertyType => _$this._propertyType;
  set propertyType(String propertyType) => _$this._propertyType = propertyType;

  String _keywords;
  String get keywords => _$this._keywords;
  set keywords(String keywords) => _$this._keywords = keywords;

  String _listerName;
  String get listerName => _$this._listerName;
  set listerName(String listerName) => _$this._listerName = listerName;

  String _listerUrl;
  String get listerUrl => _$this._listerUrl;
  set listerUrl(String listerUrl) => _$this._listerUrl = listerUrl;

  String _datasourceName;
  String get datasourceName => _$this._datasourceName;
  set datasourceName(String datasourceName) =>
      _$this._datasourceName = datasourceName;

  int _updatedDays;
  int get updatedDays => _$this._updatedDays;
  set updatedDays(int updatedDays) => _$this._updatedDays = updatedDays;

  PropertyBuilder();

  PropertyBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _summary = _$v.summary;
      _thumbUrl = _$v.thumbUrl;
      _imgUrl = _$v.imgUrl;
      _bathroomNumber = _$v.bathroomNumber;
      _bedroomNumber = _$v.bedroomNumber;
      _carSpaces = _$v.carSpaces;
      _priceFormatted = _$v.priceFormatted;
      _propertyType = _$v.propertyType;
      _keywords = _$v.keywords;
      _listerName = _$v.listerName;
      _listerUrl = _$v.listerUrl;
      _datasourceName = _$v.datasourceName;
      _updatedDays = _$v.updatedDays;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Property other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Property;
  }

  @override
  void update(void updates(PropertyBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Property build() {
    final _$result = _$v ??
        new _$Property._(
            title: title,
            summary: summary,
            thumbUrl: thumbUrl,
            imgUrl: imgUrl,
            bathroomNumber: bathroomNumber,
            bedroomNumber: bedroomNumber,
            carSpaces: carSpaces,
            priceFormatted: priceFormatted,
            propertyType: propertyType,
            keywords: keywords,
            listerName: listerName,
            listerUrl: listerUrl,
            datasourceName: datasourceName,
            updatedDays: updatedDays);
    replace(_$result);
    return _$result;
  }
}
