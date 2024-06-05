import 'package:json_annotation/json_annotation.dart';

import 'cocktail.dart';

part 'cocktail_data_response.g.dart';

@JsonSerializable()
class CocktailDataResponse {
  List<Cocktail>? drinks;

  CocktailDataResponse({this.drinks});

  factory CocktailDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CocktailDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailDataResponseToJson(this);
}
