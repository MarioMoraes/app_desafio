import 'package:app_desafio/app/core/ui/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CardCat extends StatelessWidget {
  final String name;
  final String description;
  final String image;

  const CardCat(
      {Key? key,
      required this.name,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/detail', arguments: 'Teste');
      },
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            color: context.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Text(
            description,
            style: const TextStyle(overflow: TextOverflow.clip),
          ),
        ),
        leading: SizedBox(
          height: 80,
          child: CircleAvatar(backgroundImage: NetworkImage(image)),
        ),
        trailing: const Icon(
          PhosphorIcons.caretRight,
          color: Colors.black,
        ),
      ),
    );
  }
}
