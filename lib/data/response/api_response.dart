import 'package:mvvm_with_map/data/response/status.dart';

class ApiResponse<T> {
  Status? statuss;
  T? data;
  String? message;

  ApiResponse(this.data, this.message, this.statuss);

  ApiResponse.loading() : statuss = Status.LOADING;
  ApiResponse.complete() : statuss = Status.COMPLETED;
  ApiResponse.error() : statuss = Status.ERROR;

  @override
  String toString() {
    return 'status:$statuss \n message:$message \n data:$data';
  }
}
