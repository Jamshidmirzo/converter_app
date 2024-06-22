import 'package:converter_app/models/currency.dart';
import 'package:converter_app/view_model/currencyviewmodel.dart';
import 'package:converter_app/views/widgets/cards.dart';
import 'package:converter_app/views/widgets/currencyinfo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ExchangePage extends StatefulWidget {
  ExchangePage({Key? key}) : super(key: key);

  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final currencyViewModel = Currencyviewmodel();
  late String firstTitle;
  String code = '';
  final currencyController = TextEditingController();
  String secondTitle = 'Dollar';
  double result = 0;
  double buyPrice = 0;
  double sellPrice = 0;
  String currency = 'UZS';
  bool buy = false;
  bool sell = true;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    Currency currency = await currencyViewModel.getDollar();
    setState(() {
      code = currency.code;
      firstTitle = currency.title;
      buyPrice = double.tryParse(currency.nbu_buy_price) ?? 0;
      sellPrice = double.tryParse(currency.nbu_cell_price) ?? 0;
    });
  }

  void exchange() {
    if (formKey.currentState!.validate()) {
      double amount = double.parse(currencyController.text);
      setState(() {
        result = buy ? buyPrice * amount : amount / sellPrice;
      });
    }
  }

  Future<void> _showModalBottomSheet(BuildContext context) async {
    final response = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return FutureBuilder(
          future: currencyViewModel.getfornotnull(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset('assets/lotties/loading.json',
                    width: 100, height: 100),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('ma`lumotlar hozircha yoq!'),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final currency = snapshot.data![index];
                return Currencyinfo(
                  indextopage: 0,
                  currency: currency,
                  index: index,
                );
              },
            );
          },
        );
      },
    );
    if (response != null) {
      setState(() {
        firstTitle = response['title'];
        currency = response['code'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exhange page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Cards(code: currency),
                                  ),
                                  const SizedBox(width: 30),
                                  Text(
                                    firstTitle,
                                    style: const TextStyle(
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
                                onChanged: (value) => exchange(),
                                controller: currencyController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ma`lumot korg`izing';
                                  }
                                  if (double.tryParse(value) == null) {
                                    return 'Iltimos, raqam kirg`zing!';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Input your price in $currency',
                                  prefixIcon: const Icon(Icons.monetization_on),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
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
                              setState(() {
                                currency = code;
                                buy = true;
                                sell = false;
                                currencyController.clear();
                                result = 0;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black.withOpacity(0.7),
                              ),
                              child: const Text(
                                'Sell',
                                style: TextStyle(
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
                              setState(() {
                                currency = 'UZS';
                                buy = false;
                                sell = true;
                                currencyController.clear();
                                result = 0;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black.withOpacity(0.7),
                              ),
                              child: const Text(
                                'Buy',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
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
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        buy ? "UZS" : code,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
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
