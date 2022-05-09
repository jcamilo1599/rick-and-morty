import '../../models/list/list_api_response.dart';
import 'list_api_response_info_mapper.dart';

class ListApiResponseMapper {
  Map<String, dynamic> data;

  ListApiResponseMapper(this.data);

  ListApiResponseModel execute() => ListApiResponseModel(
        info: ListApiResponseInfoMapper(data['info']).execute(),
        results: data['results'],
      );
}
