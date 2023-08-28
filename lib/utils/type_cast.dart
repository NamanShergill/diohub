T typeCast<T>(final Object? object) => object as T;
List<T> listTypeCast<T>(final Object? object) => object! as List<T>;

typedef JsonMap = Map<String, dynamic>;
