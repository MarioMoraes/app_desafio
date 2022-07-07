import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardDogDetail extends StatefulWidget {
  const CardDogDetail({Key? key}) : super(key: key);

  @override
  State<CardDogDetail> createState() => _CardDogDetailState();
}

class _CardDogDetailState extends State<CardDogDetail> {
  final teste = Modular.args.data;

  @override
  void initState() {
    super.initState();
    print(teste);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Text(
        Modular.args.data.toString(),
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}
