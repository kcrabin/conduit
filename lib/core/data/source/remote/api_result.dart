class ApiResponse<T> {
  ApiResponse({this.error, this.data});

  T? data;

  T? error;

  bool get hasData => data != null;

  bool get hasError => error != null;

  bool get isInitial => !hasData && !hasError;

  @override
  // TODO: implement props
  List<Object?> get props => [data, error];
}
