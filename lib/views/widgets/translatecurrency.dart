import 'package:easy_localization/easy_localization.dart';

class Translatecurrency {
  static final Map<String, String> currencyTranslations = {
    "AED": tr('AED'),
    "AUD": tr('AUD'),
    "CAD": tr('CAD'),
    "CHF": tr('CHF'),
    "CNY": tr('CNY'),
    "DKK": tr('DKK'),
    "EGP": tr('EGP'),
    "EUR": tr('EUR'),
    "GBP": tr('GBP'),
    "ISK": tr('ISK'),
    "JPY": tr('JPY'),
    "KRW": tr('KRW'),
    "KWD": tr('KWD'),
    "KZT": tr('KZT'),
    "LBP": tr('LBP'),
    "MYR": tr('MYR'),
    "NOK": tr('NOK'),
    "PLN": tr('PLN'),
    "RUB": tr('RUB'),
    "SEK": tr('SEK'),
    "SGD": tr('SGD'),
    "TRY": tr('TRY'),
    "UAH": tr('UAH'),
    "USD": tr('USD')
  };

  String translator({required String code}) {
    return currencyTranslations[code] ?? tr('Unknown Currency');
  }
}
