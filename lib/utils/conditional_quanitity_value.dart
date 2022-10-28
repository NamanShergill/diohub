typedef ConditionalValue<V, T> = V Function(List<T> items);

extension ConditionalQuantityValues<T> on List<T> {
  V valuesOnLength<V>({
    required Map<int, V Function()> values,
    required ConditionalValue<V, T> defaultValue,
  }) =>
      values[length]?.call() ?? defaultValue.call(this);

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
