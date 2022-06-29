import 'package:app_desafio/app/modules/home/controller/home_controller.dart';
import 'package:app_desafio/app/modules/home/widgets/card_dog.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;

  const HomePage({Key? key, required this.homeController}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.homeController.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: widget.homeController,
      listener: (context, state) {
        if (state is HomeStateError) {
          AsukaSnackbar.alert('Um Erro Ocorreu Ao Carregar Lista');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: BlocBuilder<HomeController, HomeState>(
          bloc: widget.homeController,
          builder: (context, state) {
            if (state is HomeStateLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is HomeStateLoaded) {
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemCount: state.listBreed.length,
                itemBuilder: (context, index) {
                  return CardDog(
                    name: state.listBreed[index].name,
                    bredFor: state.listBreed[index].bredFor,
                    lifeSpan: state.listBreed[index].lifeSpan,
                    image: state.listBreed[index].image.url,
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
