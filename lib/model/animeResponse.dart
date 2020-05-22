class AnimeResponseModel{
  String name;
  String genre;

  AnimeResponseModel({this.name,this.genre});

  AnimeResponseModel.fromJson(Map<String,dynamic> json){
    name = json['name'];
    genre = json['genre'];
  }
}