import 'dart:async';
import 'package:flutter_mvi/home_intent.dart';
import 'package:flutter_mvi/home_state.dart';

class HomeBloc {
  final _stateController = StreamController<HomeState>.broadcast();
  HomeState _currentState = HomeState.initial;

  // Expor o estado
  Stream<HomeState> get state => _stateController.stream;

  // Processar intents
  void handleIntent(HomeIntent intent) {
    if (intent is LoadDataIntent) {
      _loadData();
    } else if (intent is UpdateMessageIntent) {
      _updateMessage(intent.newMessage);
    }
  }

  void _loadData() async {
    _emitState(_currentState.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    _emitState(_currentState.copyWith(
      isLoading: false,
      message: "Dados carregados!",
    ));
  }

  void _updateMessage(String message) async {
    _emitState(_currentState.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    _emitState(_currentState.copyWith(message: message, isLoading: false));
  }

  void _emitState(HomeState newState) {
    _currentState = newState;
    _stateController.add(newState);
  }

  void dispose() {
    _stateController.close();
  }
}
