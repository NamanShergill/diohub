typedef ConditionalValue<V, T> = V Function(List<T> items);
typedef ConditionalEmptyValue<V> = V Function();

extension ConditionalQuantityValues<T> on List<T> {
  V valuesOnLength<V>({
    required final Map<int, V Function()> values,
    required final ConditionalValue<V, T> defaultValue,
  }) {
    if (values[length] != null) {
      return values[length]!.call();
    } else {
      return defaultValue.call(this);
    }
  }

  V valuesOnLengthBasic<V>({
    required final V Function() onNoItems,
    required final V Function(T item) onOneItem,
    required final ConditionalValue<V, T> defaultValue,
  }) =>
      valuesOnLength<V>(
        values: <int, V Function()>{
          0: onNoItems.call,
          1: () => onOneItem.call(first),
        },
        defaultValue: defaultValue,
      );
}

extension ConditionalIntValues on int {
  V valuesOnLength<V>({
    required final Map<int, V Function()> values,
    required final ConditionalEmptyValue<V> defaultValue,
  }) {
    if (values[this] != null) {
      return values[this]!.call();
    } else {
      return defaultValue.call();
    }
  }

  V valuesOnLengthBasic<V>({
    required final V Function() onZero,
    required final V Function() onOne,
    required final ConditionalEmptyValue<V> defaultValue,
  }) =>
      valuesOnLength<V>(
        values: <int, V Function()>{
          0: onZero.call,
          1: onOne.call,
        },
        defaultValue: defaultValue,
      );
}
