class CharcthersModel {
  late int charId;
  late String name;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String statusIfDeadOrAlive;
  late List<dynamic> appearanceOfSeasons;
  late String acotrName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSaulAppearance;

  CharcthersModel.fromJson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    nickName = json["nickname"];
    image = json["img"];
    jobs = json["occupation"];
    statusIfDeadOrAlive = json["status"];
    appearanceOfSeasons = json["appearance"];
    acotrName = json["portrayed"];
    categoryForTwoSeries = json["category"];
    betterCallSaulAppearance = json["better_call_saul_appearance"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['char_id'] = charId;
    data['name'] = name;
    data['nickname'] = nickName;
    data["img"] = image;
    data["jobs"] = jobs;
    data["status"] = statusIfDeadOrAlive;
    data["appearance"] = appearanceOfSeasons;
    data["portrayed"] = acotrName;
    data["category"] = betterCallSaulAppearance;
    data['better_call_saul_appearance'] = betterCallSaulAppearance;
    return data;
  }
}
