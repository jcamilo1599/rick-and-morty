import 'list_api_response_info.dart';

class ListApiResponseModel {
  final ListApiResponseInfoModel? info;
  final List? results;
  final String? message;

  ListApiResponseModel({
    required this.info,
    required this.results,
    this.message,
  });
}
