class SuperheroResponseDetail {
  final String id;
  final String name;
  final String url;
  final String fullName;
  final HeroPowerStatsResponse stats;

  SuperheroResponseDetail({
    required this.id,
    required this.name,
    required this.url,
    required this.fullName,
    required this.stats,
  });

  factory SuperheroResponseDetail.fronJson(Map<String, dynamic> json) {
    return SuperheroResponseDetail(
      id: json["id"],
      name: json["name"],
      url: json["image"]["url"],
      fullName: json["biography"]["full-name"],
      stats: HeroPowerStatsResponse.fronJson(json["powerstats"])
    );
  }
}

class HeroPowerStatsResponse {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  HeroPowerStatsResponse({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  factory HeroPowerStatsResponse.fronJson(Map<String, dynamic> json) {
    return HeroPowerStatsResponse(
      intelligence: json["intelligence"],
      strength: json["strength"],
      speed: json["speed"],
      durability: json["durability"],
      power: json["power"],
      combat: json["combat"],
    );
  }
}
