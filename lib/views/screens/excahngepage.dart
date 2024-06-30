import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:converter_app/models/currency.dart';
import 'package:converter_app/view_model/currencyviewmodel.dart';
import 'package:converter_app/views/widgets/forCurrency.dart';
import 'package:converter_app/views/widgets/cards.dart';
import 'package:converter_app/views/widgets/translatecurrency.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final currencyViewModel = Currencyviewmodel();
  late String firstTitle;
  String code = '';
  final currencyController = TextEditingController();
  double result = 0;
  double buyPrice = 0;
  double sellPrice = 0;
  String currency = 'UZS';
  bool buy = false;
  bool sell = true;
  bool _isLoading = true;
  final transltor = Translatecurrency();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    try {
      Currency currency = await currencyViewModel.getDollar();
      setState(() {
        code = currency.code;
        firstTitle = currency.title;
        buyPrice = double.tryParse(currency.nbu_buy_price) ?? 0;
        sellPrice = double.tryParse(currency.nbu_cell_price) ?? 0;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void exchange() {
    if (formKey.currentState!.validate()) {
      double amount = double.parse(currencyController.text);
      setState(() {
        result = buy ? buyPrice * amount : amount / sellPrice;
        print(buyPrice);
      });
    }
  }

  Future<void> _showModalBottomSheet(BuildContext context) async {
    final response = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Bottomforcurrency();
      },
    );
    if (response != null) {
      setState(
        () {
          firstTitle = response['title'];
          code = response['code'];
          buyPrice = double.parse(response['buyprice']);
          sellPrice = double.parse(response['cellprice']);
          currencyController.clear();
          result = 0;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('exchangepg')),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _isLoading
          ? Center(
              child: Lottie.asset('assets/lotties/loading.json',
                  width: 100, height: 100),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 500,
                    child: Column(
                      children: [
                        Flexible(
                          child: Stack(
                            children: [
                              Align(
                                alignment: const Alignment(0, -0.9),
                                child: ZoomTapAnimation(
                                  onTap: () => _showModalBottomSheet(context),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Cards(code: code),
                                        ),
                                        const SizedBox(width: 30),
                                        Text(
                                          transltor.translator(code: code),
                                          style: TextStyle(
                                            color: AdaptiveTheme.of(context)
                                                        .mode ==
                                                    AdaptiveThemeMode.light
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0.9, 0.2),
                                child: Form(
                                  key: formKey,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) => exchange(),
                                      controller: currencyController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ma`lumot kirg`izing';
                                        }
                                        if (double.tryParse(value) == null) {
                                          return 'Iltimos, raqam kirg`zing!';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        label: Text(
                                          tr('exchinput', args: [currency]),
                                          style: TextStyle(
                                            color: AdaptiveTheme.of(context)
                                                        .mode ==
                                                    AdaptiveThemeMode.light
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        prefixIcon:
                                            const Icon(Icons.monetization_on),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0.9, -0.3),
                                child: ZoomTapAnimation(
                                  onTap: () {
                                    setState(
                                      () {
                                        currency = code;
                                        buy = true;
                                        sell = false;
                                        currencyController.clear();
                                        result = 0;
                                      },
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                    child: Text(
                                      context.tr('secondcurs'),
                                      style: TextStyle(
                                        color: AdaptiveTheme.of(context).mode ==
                                                AdaptiveThemeMode.light
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(-0.9, -0.3),
                                child: ZoomTapAnimation(
                                  onTap: () {
                                    setState(
                                      () {
                                        currency = 'UZS';
                                        buy = false;
                                        sell = true;
                                        currencyController.clear();
                                        result = 0;
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    alignment: Alignment.center,
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    child: Text(
                                      context.tr('thirdcurs'),
                                      style: TextStyle(
                                        color: AdaptiveTheme.of(context).mode ==
                                                AdaptiveThemeMode.light
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              result.toStringAsFixed(2),
                              style: TextStyle(
                                color: AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              buy ? "UZS" : code,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
