/// List extension to check if a list is null or empty.
extension NullListExtension on List? {
  bool get isNullOrEmpty => this != null ? this!.isEmpty : true;

  bool get isNotNullOrEmpty => this != null ? this!.isNotEmpty : false;
}

/// List extension to get the first element that satisfies the condition.
extension NullableFirstWhere<E> on Iterable<E?> {
  E? firstWhereNull(bool Function(E element) test, {E Function()? orElse}) {
    for (var element in this) {
      if (element != null) {
        if (test(element)) {
          return element;
        }
      }
    }
    if (orElse != null) return orElse();
    return null;
  }
}
