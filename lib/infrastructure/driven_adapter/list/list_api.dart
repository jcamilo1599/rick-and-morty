import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../domain/interfaces/list/list_api_interface.dart';
import '../../../domain/mappers/list/list_api_response_mapper.dart';
import '../../../domain/models/list/list_api_response.dart';

class ListViewApi implements ListApiInterface {
  @override
  Future<ListApiResponseModel> execute({required String path}) async {
    ListApiResponseModel response;

    try {
      final Uri url = Uri.parse(path);
      final http.Response httpResponse = await http.get(url);
      final ListApiResponseMapper listApiMapper =
      ListApiResponseMapper(json.decode(utf8.decode(httpResponse.bodyBytes)));

      response = listApiMapper.execute();
    } catch (error) {
      String message = '';

      if (error is HttpException) {
        message = 'Se produjo un error... HttpException';
      } else if (error is FormatException) {
        message = 'Se produjo un error... FormatException';
      } else if (error is SocketException) {
        message = 'Se produjo un error... SocketException';
      } else if (error is TimeoutException) {
        message = 'Se produjo un error... TimeoutException';
      } else {
        message = 'Se produjo un error indefinido ☠️';
      }

      response = ListApiResponseModel(
        info: null,
        results: null,
        message: message,
      );
    }

    return response;
  }
}
