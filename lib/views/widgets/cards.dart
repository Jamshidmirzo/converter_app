import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cards extends StatefulWidget {
  String code;

  Cards({super.key, required this.code});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  List flags = [
    'https://flagpedia.net/data/flags/w580/ae.png',
    'https://img.freepik.com/premium-vector/australia-flag-blowing-wind-part-series-australia-waving-flag_126712-233.jpg',
    'https://cdn11.bigcommerce.com/s-2lbnjvmw4d/images/stencil/1280x1280/products/2852/5280/canadaflag__98669.1617275975.jpg?c=2',
    'https://img.freepik.com/free-vector/illustration-of-switzerland-flag_53876-27100.jpg?size=626&ext=jpg&ga=GA1.1.1908636980.1711929600&semt=ais',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/2560px-Flag_of_the_People%27s_Republic_of_China.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Flag_of_Denmark.svg/1200px-Flag_of_Denmark.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/800px-Flag_of_Egypt.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/255px-Flag_of_Europe.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_England.svg/250px-Flag_of_England.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Flag_of_Iceland.svg/1280px-Flag_of_Iceland.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Flag_of_Japan_%28bordered%29.svg/640px-Flag_of_Japan_%28bordered%29.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Flag_of_South_Korea_%281945–1948%29.svg/200px-Flag_of_South_Korea_%281945–1948%29.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Flag_of_Kuwait.svg/800px-Flag_of_Kuwait.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Flag_of_Kazakhstan.svg/1280px-Flag_of_Kazakhstan.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Flag_of_Lebanon.svg/1200px-Flag_of_Lebanon.svg.png',
    'https://i.pinimg.com/736x/6e/b8/d3/6eb8d3cf75de1643c9a269fd170e0575.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/250px-Flag_of_Norway.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Flag_of_Poland.svg/800px-Flag_of_Poland.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Russia.svg/250px-Flag_of_Russia.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Flag_of_Sweden.svg/2560px-Flag_of_Sweden.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Flag_of_Singapore.svg/1200px-Flag_of_Singapore.svg.png',
    'https://tolerance-homes.ru/storage/images/pages/l0Ifgk8JbUb7tKmC9LbJA5aukc8XjwzPqvvH9jph.jpeg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Ukraine.svg/800px-Flag_of_Ukraine.svg.png',
    'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg'
  ];

  int id = 23;

  filterbycode() {
    print(widget.code);
    switch (widget.code) {
      case "AED":
        id = 0;
      case "AUD":
        id = 1;
      case "CAD":
        id = 2;
      case "CHF":
        id = 3;
      case "CNY":
        id = 4;
      case "DKK":
        id = 5;
      case "EGP":
        id = 6;
      case "EUR":
        id = 7;
      case "GBP":
        id = 8;
      case "ISK":
        id = 9;
      case "JPY":
        id = 10;
      case "KRW":
        id = 11;
      case "KWD":
        id = 12;
      case "KZT":
        id = 13;
      case "LBP":
        id = 14;
      case "MYR":
        id = 15;
      case "NOK":
        id = 16;
      case "PLN":
        id = 17;
      case "RUB":
        id = 18;
      case "SEK":
        id = 19;
      case "SGD":
        id = 20;
      case "TRY":
        id = 21;
      case "UAH":
        id = 22;
      case "USD":
        id = 23;
    }
  }

  @override
  void initState() {
    filterbycode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(flags[id]),
        ),
      ),
    );
  }
}
