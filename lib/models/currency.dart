import 'package:json_annotation/json_annotation.dart';
part 'currency.g.dart';

@JsonSerializable()
class Currency {
  String title;
  String code;
  String cb_price;
  String nbu_buy_price;
  String nbu_cell_price;
  // String date;
  Currency(
      {required this.cb_price,
      required this.code,
      // required this.date,
      required this.nbu_buy_price,
      required this.nbu_cell_price,
      required this.title});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return _$CurrencyFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$CurrencyToJson(this);
  }
}
