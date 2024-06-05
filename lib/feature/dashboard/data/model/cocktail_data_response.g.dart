// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailDataResponse _$CocktailDataResponseFromJson(
        Map<String, dynamic> json) =>
    CocktailDataResponse(
      drinks: (json['drinks'] as List<dynamic>?)
          ?.map((e) => Cocktail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CocktailDataResponseToJson(
        CocktailDataResponse instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };
