// ignore_for_file: public_member_api_docs, sort_constructors_first

List<OperatorModel> listOperator = [
  OperatorModel(code: "telkomsel", name: "Telkomsel"),
  OperatorModel(code: "xl", name: "XL"),
  OperatorModel(code: "axis", name: "Axis"),
  OperatorModel(code: "three", name: "Tri"),
  OperatorModel(code: "indosat", name: "Indosat"),
];

List<OperatorModel> listOperatorPaketData = [
  OperatorModel(code: "telkomsel_paket_internet", name: "Telkomsel"),
  OperatorModel(code: "xl_paket_internet", name: "XL"),
  OperatorModel(code: "axis_paket_internet", name: "Axis"),
  OperatorModel(code: "tri_paket_internet", name: "Tri"),
  OperatorModel(code: "indosat_paket_internet", name: "Indosat"),
];

class OperatorModel {
  String code;
  String name;
  OperatorModel({
    required this.code,
    required this.name,
  });
}

String generateRefId(String id) {
  final randomInt = "${DateTime.now().millisecondsSinceEpoch}$id";
  return randomInt;
}
