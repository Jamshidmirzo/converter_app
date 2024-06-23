import 'package:easy_localization/easy_localization.dart';

class Translatecurrency {
  String translator({required String code}) {
    switch (code) {
      case "AED":
        return tr('AED');
      case "AUD":
        return tr('AUD');
      case "CAD":
        return tr('CAD');
      case "CHF":
        return tr('CHF');
      case "CNY":
        return tr('CNY');
      case "DKK":
        return tr('DKK');
      case "EGP":
        return tr('EGP');
      case "EUR":
        return tr('EUR');
      case "GBP":
        return tr('GBP');
      case "ISK":
        return tr('ISK');
      case "JPY":
        return tr('JPY');
      case "KRW":
        return tr('KRW');
      case "KWD":
        return tr('KWD');
      case "KZT":
        return tr('KZT');
      case "LBP":
        return tr('LBP');
      case "MYR":
        return tr('MYR');
      case "NOK":
        return tr('NOK');
      case "PLN":
        return tr('PLN');
      case "RUB":
        return tr('RUB');
      case "SEK":
        return tr('SEK');
      case "SGD":
        return tr('SGD');
      case "TRY":
        return tr('TRY');
      case "UAH":
        return tr('UAH');
      case "USD":
        return tr('USD');
      default:
        return tr('Unknown Currency');
    }
  }
}
