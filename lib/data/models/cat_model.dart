class CatModel {
  CatModel(this.id, this.url, this.width, this.height);

  final String id;
  final String url;
  final int width;
  final int height;

  factory CatModel.fromJson(Map<String,dynamic> json){
    return CatModel(json["id"], json ["url"], json ["width"], json["height"]);

  }
}