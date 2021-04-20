import '../base_data.dart';

class PageData<T> {
  List<T> data;
  int totalPages;
  int totalElements;
  bool hasNext;

  PageData(this.data, this.totalPages, this.totalElements, this.hasNext);

  PageData.fromJson(Map<String, dynamic> json, fromJsonFunction<T> fromJson):
        data = dataFromJson(json['data'], fromJson),
        totalPages = json['totalPages'],
        totalElements = json['totalElements'],
        hasNext = json['hasNext'];

  @override
  String toString() {
    return 'PageData{data: $data, totalPages: $totalPages, totalElements: $totalElements, hasNext: $hasNext}';
  }
}

PageData<T> emptyPageData<T>() => PageData<T>([], 0, 0, false);

List<T> dataFromJson<T>(List<dynamic> jsonData, fromJsonFunction<T> fromJson) {
  return jsonData.map((e) => fromJson(e)).toList();
}
