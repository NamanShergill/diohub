typedef ConditionalValue<V, T> = V Function(List<T> items);
typedef ConditionalEmptyValue<V> = V Function();

extension ConditionalQuantityValues<T> on List<T> {
  V valuesOnLength<V>({
    required Map<int, V Function()> values,
    required ConditionalValue<V, T> defaultValue,
  }) {
    if (values[length] != null) {
      return values[length]!.call();
    } else {
      return defaultValue.call(this);
    }
  }

  V valuesOnLengthBasic<V>({
    required V Function() onNoItems,
    required V Function(T item) onOneItem,
    required ConditionalValue<V, T> defaultValue,
  }) =>
      valuesOnLength<V>(
        values: {
          0: () => onNoItems.call(),
          1: () => onOneItem.call(first),
        },
        defaultValue: defaultValue,
      );
}

extension ConditionalIntValues on int {
  V valuesOnLength<V>({
    required Map<int, V Function()> values,
    required ConditionalEmptyValue<V> defaultValue,
  }) {
    if (values[this] != null) {
      return values[this]!.call();
    } else {
      return defaultValue.call();
    }
  }

  V valuesOnLengthBasic<V>({
    required V Function() onZero,
    required V Function() onOne,
    required ConditionalEmptyValue<V> defaultValue,
  }) =>
      valuesOnLength<V>(
        values: {
          0: () => onZero.call(),
          1: () => onOne.call(),
        },
        defaultValue: defaultValue,
      );
}
