
class NumberFactResponse {
  String? text;
  int? number;
  bool? found;
  String? type;

  NumberFactResponse({this.text, this.number, this.found, this.type});

  NumberFactResponse.fromJson(Map<String, dynamic> json) {
    if(json["text"] is String) {
      text = json["text"];
    }
    if(json["number"] is num) {
      number = (json["number"] as num).toInt();
    }
    if(json["found"] is bool) {
      found = json["found"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
  }

  static List<NumberFactResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => NumberFactResponse.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["text"] = text;
    _data["number"] = number;
    _data["found"] = found;
    _data["type"] = type;
    return _data;
  }

  NumberFactResponse copyWith({
    String? text,
    int? number,
    bool? found,
    String? type,
  }) => NumberFactResponse(
    text: text ?? this.text,
    number: number ?? this.number,
    found: found ?? this.found,
    type: type ?? this.type,
  );
}