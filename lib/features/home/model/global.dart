class Global {
  int? _cases;
  int? _deaths;
  int? _recovered;

  int? get cases => _cases;
  int? get deaths => _deaths;
  int? get recovered => _recovered;

  Global({
      int? cases, 
      int? deaths, 
      int? recovered}){
    _cases = cases;
    _deaths = deaths;
    _recovered = recovered;
}

  Global.fromJson(dynamic json) {
    _cases = json['cases'];
    _deaths = json['deaths'];
    _recovered = json['recovered'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['cases'] = _cases;
    map['deaths'] = _deaths;
    map['recovered'] = _recovered;
    return map;
  }

}