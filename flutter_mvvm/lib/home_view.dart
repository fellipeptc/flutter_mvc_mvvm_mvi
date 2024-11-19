import 'package:flutter/material.dart';
import 'package:flutter_mvvm/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, value, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('Flutter MVVM')),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Nome: ${value.user.name}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "Email: ${value.user.email}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    value.updateUser("Fellipe Prates", "fellipe@example.com");
                  },
                  child: const Text("Atualizar usuário"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
