import 'package:flutter/material.dart';
import 'package:flutter_mvc/home/home_controller.dart';
import 'package:flutter_mvc/home/home_model.dart';
import 'package:flutter_mvc/widgets/alert_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeModel _homeModel = HomeModel();
  late HomeController _homeController;

  @override
  void initState() {
    //Irá notificar os ouvintes que estão no HomeModel estabelicido na função.
    //Toda vez que notificar, irá executar o setState.
    _homeModel.addListener(() => setState(() {}));
    _homeController = HomeController(_homeModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Lista de nomes',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: _buildFloatingButton(),
      bottomNavigationBar: _buildBottomNavigator(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return ListView(
      children: [
        ..._homeController.names.map(
          (n) => Dismissible(
            key: Key(n),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _homeController.removeName(n);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$n foi deletado')),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.delete, color: Colors.white),
                  Text(
                    'Deletar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.person,
                size: 24,
                color: Colors.black45,
              ),
              title: Text(
                n,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildFloatingButton() {
    return FloatingActionButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: const Icon(Icons.add, color: Colors.white),
      onPressed: () async {
        var text = await CustomAlertDialog.show<String>(context);
        if (text == null) return;
        _homeController.addName(text);
      },
    );
  }

  _buildBottomNavigator() {
    return BottomAppBar(
      notchMargin: 5,
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      color: Colors.black87,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                tooltip: 'Limpar',
                icon: const Icon(Icons.delete),
                onPressed: _homeController.removeAll,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
