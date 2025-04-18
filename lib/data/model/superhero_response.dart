import 'package:superhero_app/data/model/superhero_response_detail.dart';

class SuperheroResponse {
  final String response;
  final List<SuperheroResponseDetail> reponseSuperheroDetail;

  SuperheroResponse({
    required this.response,
    required this.reponseSuperheroDetail,
  });

  factory SuperheroResponse.fromJson(Map<String, dynamic> json) {
    var list = json["results"] as List?;
    List<SuperheroResponseDetail> heroList =
        list != null
            ? list
                .map((hero) => SuperheroResponseDetail.fronJson(hero))
                .toList()
            : [];
    return SuperheroResponse(
      response: json["response"] ?? "error",
      reponseSuperheroDetail: heroList,
    );
  }
}
