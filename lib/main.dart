import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Photos Updated Successfully!');
        },
        child: Icon(Icons.arrow_upward_outlined),
      ),
      appBar: AppBar(
        title: Text("Photo Gallery"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Welcome To My Photos Gallery !',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for Photos....',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30),
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    footer: Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'Photos $index',
                        ),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        print('Hello World');
                      },
                      child: Image.asset('images/images.webp'),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Photos $index'),
                    subtitle: Text('Description on $index'),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
