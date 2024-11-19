import 'package:flutter/material.dart';
import 'package:flutter_mvi/home_bloc.dart';
import 'package:flutter_mvi/home_intent.dart';
import 'package:flutter_mvi/home_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   final HomeBloc bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    bloc.handleIntent(LoadDataIntent());
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo - MVI')),
      body: StreamBuilder<HomeState>(
        stream: bloc.state,
        initialData: HomeState.initial,
        builder: (context, snapshot) {
          final state = snapshot.data!;
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(state.message, style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    bloc.handleIntent(UpdateMessageIntent("Novos Dados\n${DateTime.now()}"));
                  },
                  child: const Text('Atualizar Mensagem'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}