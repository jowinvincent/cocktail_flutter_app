import 'core_error_model.dart';

class CoreResponseModel<T> {
  /// Generic response expected from API.

  T? response;

  /// Error with error code and error message

  CoreErrorModel? error;

  CoreResponseModel({this.response, this.error});
}
