import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resto_app_v2/data/model/resto_list.dart';
import 'package:resto_app_v2/data/model/resto_detail.dart';
import 'package:resto_app_v2/data/model/resto_search.dart';

class ApiService {
  final String _base = 'https://restaurant-api.dicoding.dev';
  final String _list = '/list';
  final String _detail = '/detail/';
  final String _search = '/search?q=';

  Future<RestoList> restoList() async {
    final response = await http.get(Uri.parse(_base + _list));
    if (response.statusCode == 200) {
      return RestoList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat daftar restoran');
    }
  }

  Future<RestoDetail> restoDetail(String id) async {
    final response = await http.get(Uri.parse(_base + _detail + id));
    if (response.statusCode == 200) {
      return RestoDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat detail restoran');
    }
  }

  Future<RestoSearch> restoSearch(String query) async {
    final response = await http.get(Uri.parse(_base + _search + query));
    if (response.statusCode == 200) {
      return RestoSearch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat pencarian restoran');
    }
  }
}
