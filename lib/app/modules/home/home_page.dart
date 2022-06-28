import 'package:app_desafio/app/modules/home/controller/home_controller.dart';
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
        if (state is HomeStateLoading) {
          print('aqui');
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: BlocBuilder<HomeController, HomeState>(
          bloc: widget.homeController,
          builder: (context, state) {
            if (state is HomeStateLoaded) {
              return ListView.builder(
                  itemCount: state.listBreed.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(state.listBreed[index].name));
                  });
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
