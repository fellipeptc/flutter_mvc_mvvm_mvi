import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({super.key});

  static Future<T?> show<T>(
    BuildContext context, {
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      useRootNavigator: true,
      builder: (context) => const CustomAlertDialog(),
    );
  }

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(36),
      backgroundColor: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Insira um nome na lista',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Digite o nome',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isEmpty) return;
                Navigator.pop(context, _nameController.text.trim());
              },
              child: const Text("Adicionar"),
            ),
          ],
        ),
      ),
    );
  }
}
