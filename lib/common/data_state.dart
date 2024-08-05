enum DataStatus { initial, success, failure }

class ListState<T> extends DataState<List<T?>> {
  ListState({
    status = DataStatus.initial,
    List<T?>? items,
    String? errorMsg,
    this.hasReachedMax = false,
  }) : super(
          status: status,
          data: items ?? <T?>[],
          errorMsg: errorMsg,
        );

  final bool hasReachedMax;

  @override
  ListState<T> copyWith({
    DataStatus? status,
    List<T?>? data,
    String? errorMsg,
    bool? hasReachedMax,
  }) {
    return ListState<T>(
      status: status ?? this.status,
      items: data ?? this.data,
      errorMsg: errorMsg ?? this.errorMsg,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''ListState { status: $status, hasReachedMax: $hasReachedMax, items: ${data?.length}, error: $errorMsg}''';
  }
}

class DataState<T> {
  DataState({this.status = DataStatus.initial, this.data, this.errorMsg});

  final DataStatus status;
  final T? data;
  String? errorMsg;

  DataState<T> copyWith({DataStatus? status, T? data, String? errorMsg}) {
    return DataState<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, data: $data, error: $errorMsg} }''';
  }
}
