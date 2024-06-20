import 'package:converter_app/view_model/currencyviewmodel.dart';
import 'package:converter_app/views/widgets/cards.dart';
import 'package:converter_app/views/widgets/currencyinfo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class Excahngepage extends StatefulWidget {
  int index;
  final currency;
  Excahngepage({super.key, required this.currency, required this.index});

  @override
  State<Excahngepage> createState() => _ExcahngepageState();
}

class _ExcahngepageState extends State<Excahngepage> {
  late String firsttitle;
  String code = '';
  final currencycontroller = TextEditingController();
  String secondtitle = 'Dollar';
  String newtitel = '';
  int index = 0;
  double result = 0;
  double buyprice = 0;
  double sellprice = 0;
  String currency = 'UZS';
  bool buy = false;
  bool sell = true;
  final formkey = GlobalKey<FormState>();
  final currcenviewmodel = Currencyviewmodel();
  @override
  void initState() {
    code = widget.currency.code;
    index = widget.index;
    firsttitle = widget.currency.title;
    buyprice = double.tryParse(widget.currency.nbu_buy_price) ?? 0;
    sellprice = double.tryParse(widget.currency.nbu_cell_price) ?? 0;
    super.initState();
  }

  exchange() {
    if (formkey.currentState!.validate()) {
      if (buy) {
        result = buyprice * double.parse(currencycontroller.text);
        setState(() {});
      }
      if (sell) {
        result = double.parse(currencycontroller.text) / sellprice;
      }
    }
  }

  void _showModalBottomSheet(BuildContext context) async {
    final responce = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return FutureBuilder(
          future: currcenviewmodel.getfornotnull(),
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
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('ma`lumotlar hozircha yoq!'),
              );
            }
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
              padding: const EdgeInsets.all(20),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final currency = snapshot.data![index];
                return Currencyinfo(
                  indextopage: 0,
                  currency: currency,
                  index: index,
                  more: false,
                );
              },
            );
          },
        );
      },
    );
    if (responce != null) {
      setState(() {});
      firsttitle = responce['title'];
      index = responce['photo'];
      code = responce['code'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
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
                              onTap: () {
                                _showModalBottomSheet(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: double.infinity,
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Cards(id: index),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      firsttitle,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0.9, 0.2),
                            child: Form(
                              key: formkey,
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  onChanged: (value) {
                                    exchange();
                                  },
                                  controller: currencycontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Ma`lumot korg`izing';
                                    }
                                    if (int.tryParse(value) == null) {
                                      return 'iltimos raqam kirg`zing !';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Input your price in $currency',
                                    prefixIcon:
                                        const Icon(Icons.monetization_on),
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
                                setState(() {});
                                currency = code;
                                buy = true;
                                sell = false;
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black.withOpacity(0.7)),
                                  child: const Text(
                                    'Sell',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(-0.9, -0.3),
                            child: ZoomTapAnimation(
                              onTap: () {
                                currency = 'UZS';
                                buy = false;
                                sell = true;
                                setState(() {});
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black.withOpacity(0.7)),
                                  child: const Text(
                                    'Buy',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  )),
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
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          buy ? "UZS" : code,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
