import 'dart:convert';

class CustomTranslation {
  Map<String, dynamic>? enUs;
  Map<String, dynamic>? csCz;
  Map<String, dynamic>? plPl;
  Map<String, Map<String, dynamic>>? translationMap;

  CustomTranslation({this.translationMap}) {
    if (translationMap != null) {
      enUs = translationMap!['en_US'];
      csCz = translationMap!['cs_CZ'];
      plPl = translationMap!['pl_PL'];
    }
  }

  CustomTranslation.fromJson(Map<String, dynamic> json) {
    translationMap = (json['translationMap'] as Map<String, dynamic>).map(
      (key, value) => MapEntry(
        key,
        (jsonDecode(value) as Map<String, dynamic>).map(
          (k, v) => MapEntry(k, v as dynamic),
        ),
      ),
    );

    if (translationMap != null) {
      enUs = translationMap!['en_US'];
      csCz = translationMap!['cs_CZ'];
      plPl = translationMap!['pl_PL'];
    }
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    if (translationMap != null) {
      json['translationMap'] = translationMap;
    }
    return json;
  }

  @override
  String toString() {
    return 'CustomTranslation{enUs: $enUs, csCz: $csCz, plPL: $plPl, translationMap: $translationMap}';
  }
}
