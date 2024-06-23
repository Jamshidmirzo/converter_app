import 'package:converter_app/views/widgets/cards.dart';
import 'package:converter_app/views/widgets/translatecurrency.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class Currencyinfo extends StatefulWidget {
  final currency;
  int index;
  int indextopage;

  Currencyinfo(
      {super.key,
      required this.currency,
      required this.index,
      required this.indextopage});

  @override
  State<Currencyinfo> createState() => _CurrencyinfoState();
}

class _CurrencyinfoState extends State<Currencyinfo> {
  bool isNotif = false;
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        if (widget.indextopage == 0) {
          Navigator.pop(context, {
            'title': widget.currency.title,
            'photo': widget.index,
            'buyprice': widget.currency.nbu_buy_price,
            'cellprice': widget.currency.nbu_cell_price,
            'code': widget.currency.code
          });
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Cards(
                    code: widget.currency.code,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    Translatecurrency().translator(code: widget.currency.code),
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        isNotif = !isNotif;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.notifications_active,
                        color: isNotif
                            ? Theme.of(context).colorScheme.errorContainer
                            : null,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(context.tr('maincurs')),
                      Text(
                        widget.currency.cb_price,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(context.tr('secondcurs')),
                      Text(
                        widget.currency.nbu_cell_price.isEmpty
                            ? '-'
                            : widget.currency.nbu_cell_price,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(context.tr('thirdcurs')),
                      Text(
                        widget.currency.cb_price,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
