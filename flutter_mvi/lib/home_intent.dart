// No BLOC seria o HomeEvent para gerar os eventos
abstract class HomeIntent {}

class LoadDataIntent extends HomeIntent {}

class UpdateMessageIntent extends HomeIntent {
  final String newMessage;

  UpdateMessageIntent(this.newMessage);
}