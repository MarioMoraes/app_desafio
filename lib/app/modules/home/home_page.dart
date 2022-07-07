import 'package:app_desafio/app/modules/home/controller/home_controller.dart';
import 'package:app_desafio/app/modules/home/widgets/card_cat.dart';
import 'package:app_desafio/app/modules/home/widgets/card_dog.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;

  const HomePage({Key? key, required this.homeController}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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
        body: _selectedIndex == 0
            ? BlocBuilder<HomeController, HomeState>(
                bloc: widget.homeController,
                builder: (context, state) {
                  if (state is HomeStateLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if (state is HomeStateLoaded) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      itemCount: state.listDogs!.length,
                      itemBuilder: (context, index) {
                        return CardDog(
                          name: state.listDogs![index].name,
                          bredFor: state.listDogs![index].bredFor,
                          lifeSpan: state.listDogs![index].lifeSpan,
                          image: state.listDogs![index].image.url,
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            : BlocBuilder<HomeController, HomeState>(
                bloc: widget.homeController,
                builder: (context, state) {
                  if (state is HomeStateLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if (state is HomeStateLoaded) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      itemCount: state.listCats!.length,
                      itemBuilder: (context, index) {
                        return CardCat(
                          name: state.listCats![index].name,
                          description: state.listCats![index].description,
                          image: state.listCats![index].image!.url,
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
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(PhosphorIcons.dog),
              label: 'Dogs',
            ),
            BottomNavigationBarItem(
              icon: Icon(PhosphorIcons.cat),
              label: 'Cats',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          iconSize: 20,
          onTap: _onTap,
          elevation: 15,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
