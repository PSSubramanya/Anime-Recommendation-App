import 'dart:convert';

import 'package:anime_recommendation_app/model/animeResponse.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RecommendationController extends ChangeNotifier {
  TextEditingController animeName;
  List<AnimeResponseModel> model = [];

  RecommendationController() {
    animeName = TextEditingController();
  }


  getRecommandation() async {
    try{
      model.clear();
      http.Request request = http.Request("GET", Uri.parse("http://15.206.75.96/anime/?anime=${animeName.text}."));
      http.StreamedResponse response = await request.send();
      if(response.statusCode == 200){
        var obj = await utf8.decodeStream(response.stream);
        var data = json.decode(obj);
        data.forEach((element){
          model.add(AnimeResponseModel.fromJson(element));
        });
        notifyListeners();
      }
    }catch(e){

    }
  }
}
