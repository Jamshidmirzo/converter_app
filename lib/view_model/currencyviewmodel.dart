import 'package:converter_app/models/currency.dart';
import 'package:converter_app/services/currecyservice.dart';

class Currencyviewmodel {
  List<Currency> _list = [];
  final httpservice = Currecyservice();
  Future<List<Currency>> getCurency([String title = '']) async {
    _list = await httpservice.getCurrency();
    List<Currency> _filterlist = [];
    for (var i in _list) {
      print(i.title);
      if (i.title.toLowerCase().contains(title.toLowerCase())) {
        _filterlist.add(i);
      }
    }
    _list = _filterlist;
    return [..._list];
  }

  Future<List<Currency>> getfornotnull() async {
    List<Currency> _notnull = [];
    _list = await httpservice.getCurrency();
    for (var element in _list) {
      if (element.nbu_cell_price.isNotEmpty) {
        _notnull.add(element);
      }
    }
    return [..._notnull];
  }
}
