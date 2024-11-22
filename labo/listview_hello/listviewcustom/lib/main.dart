import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InfiniteScrollExample(),
    );
  }
}

class InfiniteScrollExample extends StatefulWidget {
  @override
  _InfiniteScrollExampleState createState() => _InfiniteScrollExampleState();
}

class _InfiniteScrollExampleState extends State<InfiniteScrollExample> {
  final List<String> _items = []; // Liste des éléments affichés
  final int _itemsPerPage = 20; // Nombre d'éléments à charger par page
  bool _isLoading = false; // Indique si un chargement est en cours
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchMoreItems(); // Charger les premiers éléments
    _scrollController.addListener(() {
      // Détecter si on atteint la fin de la liste
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        _fetchMoreItems();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchMoreItems() async {
    setState(() {
      _isLoading = true;
    });

    // Simulation d'un délai pour récupérer les données (comme un appel d'API)
    await Future.delayed(Duration(seconds: 2));
    List<String> newItems = List.generate(
        _itemsPerPage, (index) => 'Article ${_items.length + index + 1}');

    setState(() {
      _items.addAll(newItems);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste avec chargement infini'),
      ),
      body: ListView.custom(
        controller: _scrollController, // Permet de détecter le défilement
        childrenDelegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (index < _items.length) {
              // Afficher les éléments de la liste
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: Icon(Icons.article),
                  title: Text(_items[index]),
                  subtitle: Text('Détails de ${_items[index]}'),
                ),
              );
            } else if (_isLoading) {
              // Afficher un indicateur de chargement
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return null; // Aucun widget supplémentaire
          },
          childCount: _items.length + (_isLoading ? 1 : 0),
        ),
      ),
    );
  }
}