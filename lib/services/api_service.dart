import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  //오늘의 웹툰 목록
  static Future<List<WebtoonModel>> getTodaysWebtoons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    List<WebtoonModel> webtoonInstances = [];
    if (response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  // 특정 웹툰 상세정보
  static Future<WebtoonDetailModel> getWebtoonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoonDetail = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoonDetail);
    }
    throw Error();
  }

  // 특정 웹툰 에피소드 목록
  static Future<List<WebtoonEpisodeModel>> getEpisodes(String id) async {
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    List<WebtoonEpisodeModel> webtoonEpisodesInstances = [];
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        final instance = WebtoonEpisodeModel.fromJson(episode);
        webtoonEpisodesInstances.add(instance);
      }
      return webtoonEpisodesInstances;
    }
    throw Error();
  }
}
