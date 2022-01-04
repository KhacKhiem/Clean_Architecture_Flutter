import 'dart:convert';

import 'package:flutter_application_1/core/constant.dart';
import 'package:flutter_application_1/data/models/station_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<List<StationModel>> getStations() async {
    final res = await http.get(Uri.parse(kBaseUrlStation));
    // return (res.body as List).map((e) => StationModel.fromJson(e)).toList();
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<StationModel> stations = body
          .map(
            (dynamic item) => StationModel.fromJson(item),
          )
          .toList();

      return stations;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
