// O modelo de estado imutável para ser exibido
class HomeState {
  final String message;
  final bool isLoading;

  const HomeState({
    required this.message,
    required this.isLoading,
  });

  static const initial = HomeState(message: "Bem-vindo!", isLoading: false);

  //Prar gerar um novo modelo/estado quando ocorre alterações na UI
  HomeState copyWith({String? message, bool? isLoading}) {
    return HomeState(
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
    );
  }

}
