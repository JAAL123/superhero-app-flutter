import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_response.dart';
import 'package:superhero_app/data/model/superhero_response_detail.dart';
import 'package:superhero_app/data/repository.dart';

class SuperheroSearchScreen extends StatefulWidget {
  const SuperheroSearchScreen({super.key});

  @override
  State<SuperheroSearchScreen> createState() => _SuperheroSearchScreenState();
}

class _SuperheroSearchScreenState extends State<SuperheroSearchScreen> {
  Future<SuperheroResponse?>? _superheroInfo;
  Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Superhero Search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Superhero...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  _superheroInfo = repository.fetchSuperheroInfo(text);
                });
              },
            ),
          ),
          bodyList(),
        ],
      ),
    );
  }

  FutureBuilder<SuperheroResponse?> bodyList() {
    return FutureBuilder(
      future: _superheroInfo,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          var superheroList = snapshot.data?.reponseSuperheroDetail;
          if (superheroList == null || superheroList.isEmpty) {
            return Text("No hay resultados");
          }
          return Expanded(
            child: ListView.builder(
              itemCount: superheroList.length,
              itemBuilder: (context, index) {
                return itemSuperhero(superheroList[index]);
              },
            ),
          );
        } else {
          return Text("No hay resultados");
        }
      },
    );
  }

  Padding itemSuperhero(SuperheroResponseDetail hero) => Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.redAccent,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              hero.url,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment(0, -0.6),
              errorBuilder: (context, error, stackTrace) {
                // Mostrar un widget alternativo si ocurre un error
                return Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.white,
                    size: 50,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hero.name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
