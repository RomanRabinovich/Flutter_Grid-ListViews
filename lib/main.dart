import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGrid = true;

  List<String> items = [
    'Anna',
    'Anena',
    'Snna',
    'Annwa',
    'Ainnta',
    'Knnda',
    'Alnna',
    'Annaww',
    'Tnddna',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('ListView VS GridView'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.grid_view)),
            IconButton(
                onPressed: () {
                  ListView();
                },
                icon: Icon(Icons.list))
          ],
        ),
        body: buildList(),
      );
  Widget buildList() => isGrid
      ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return GridTile(
              footer: Container(
                padding: EdgeInsets.all(12),
                alignment: Alignment.center,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              child: InkWell(
                child: Ink.image(
                  image: NetworkImage(
                      'https://source.unsplash.com/random?sig=$index'),
                  fit: BoxFit.cover,
                ),
                onTap: () => selectItem(item),
              ),
            );
          },
        )
      : ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                    'https://source.unsplash.com/random?sig=$index'),
              ),
              title: Text(item),
              subtitle: Text('Subtitle $index'),
              onTap: () => selectItem(item),
            );
          },
        );

  void selectItem(String item) {
    final snackBar = SnackBar(
      content: Text(
        'Selected $item...',
        style: TextStyle(fontSize: 24),
      ),
      backgroundColor: Colors.pink,
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

enum ViewType { grid, list }
