import '../../models/list/list_api_response_info.dart';

class ListApiResponseInfoMapper {
  Map<String, dynamic> data;

  ListApiResponseInfoMapper(this.data);

  ListApiResponseInfoModel execute() => ListApiResponseInfoModel(
        next: data['next'],
        prev: data['prev'],
        pages: data['pages'],
        count: data['count'],
      );
}
