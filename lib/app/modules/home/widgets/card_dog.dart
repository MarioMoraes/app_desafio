import 'package:app_desafio/app/core/ui/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CardDog extends StatelessWidget {
  final String? name;
  final String? bredFor;
  final String? lifeSpan;
  final String? image;

  const CardDog({Key? key, this.name, this.bredFor, this.lifeSpan, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.navigate('/home/detail', arguments: {
          name,
          image,
        });
      },
      child: ListTile(
        title: Text(
          name!,
          style: TextStyle(
            color: context.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(lifeSpan! + '\n' + bredFor!),
        leading: SizedBox(
          height: 60,
          child: CircleAvatar(backgroundImage: NetworkImage(image!)),
        ),
        trailing: const Icon(
          PhosphorIcons.caretRight,
          color: Colors.black,
        ),
      ),
    );
  }
}
