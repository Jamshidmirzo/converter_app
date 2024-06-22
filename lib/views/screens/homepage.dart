import 'package:converter_app/view_model/currencyviewmodel.dart';
import 'package:converter_app/views/widgets/currencyinfo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final currcenviewmodel = Currencyviewmodel();
  bool issearch = false;
  final titlecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  filter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          issearch
              ? TextButton(
                  onPressed: () {
                    issearch = !issearch;
                    titlecontroller.clear();

                    setState(() {});
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.inversePrimary),
                  ),
                  onPressed: () {
                    issearch = !issearch;
                    setState(() {});
                  },
                  icon: const Icon(Icons.search),
                )
        ],
        title: issearch
            ? Form(
                key: formkey,
                child: TextFormField(
                  controller: titlecontroller,
                  decoration: InputDecoration(
                    labelText: 'Input currency',
                    fillColor: Theme.of(context).colorScheme.inversePrimary,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onChanged: (value) {
                    filter();
                  },
                ))
            : Text(
                'Курс валют',
                style: GoogleFonts.aboreto(),
              ),
      ),
      body: Column(
        children: [
          Flexible(
            child: FutureBuilder(
              future: currcenviewmodel.getCurency(titlecontroller.text),
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
                      indextopage: 1,
                      currency: currency,
                      index: index,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
