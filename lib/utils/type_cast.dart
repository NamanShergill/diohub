import 'package:flutter/cupertino.dart';

T typeCast<T>(final Object? object) => object as T;
List<T> listTypeCast<T>(final Object? object) => object! as List<T>;

@optionalTypeArgs
typedef TypeMap<T> = Map<String, T>;

typedef DynamicList = List<dynamic>;
typedef APIMap = Map<dynamic, dynamic>;
