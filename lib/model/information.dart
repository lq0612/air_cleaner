import 'dart:convert' show json;

class RegionResp {
  int errno;
  String error;
  Data data;

  RegionResp.fromParams({this.errno, this.error, this.data});

  factory RegionResp(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new RegionResp.fromJson(json.decode(jsonStr))
          : new RegionResp.fromJson(jsonStr);

  RegionResp.fromJson(jsonRes) {
    errno = jsonRes['errno'];
    error = jsonRes['error'];
    data = jsonRes['data'] == null ? null : new Data.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"errno": $errno,"error": ${error != null ? '${json.encode(error)}' : 'null'},"data": $data}';
  }
}

class Data {
  double current_value;
  String id;
  String unit;
  String unit_symbol;
  String update_at;

  Data.fromParams(
      {this.current_value,
      this.id,
      this.unit,
      this.unit_symbol,
      this.update_at});

  Data.fromJson(jsonRes) {
    current_value = jsonRes['current_value'];
    id = jsonRes['id'];
    unit = jsonRes['unit'];
    unit_symbol = jsonRes['unit_symbol'];
    update_at = jsonRes['update_at'];
  }

  @override
  String toString() {
    return '{"current_value": $current_value,"id": ${id != null ? '${json.encode(id)}' : 'null'},"unit": ${unit != null ? '${json.encode(unit)}' : 'null'},"unit_symbol": ${unit_symbol != null ? '${json.encode(unit_symbol)}' : 'null'},"update_at": ${update_at != null ? '${json.encode(update_at)}' : 'null'}}';
  }
}
