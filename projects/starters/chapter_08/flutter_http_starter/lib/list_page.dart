import 'package:flutter/material.dart';
import 'package:flutter_http/list_model.dart';
import 'package:flutter_http/list_repository.dart';
import 'package:weather_icons/weather_icons.dart';

class ListPageWidget extends StatefulWidget {
  @override
  State<ListPageWidget> createState() => _ListPageWidgetState();
}

class _ListPageWidgetState extends State<ListPageWidget> {
  final repository = ListRepository();
  Future<List<WeatherCityItem>>? listRequest;

  @override
  void initState() {
    super.initState();
    listRequest = repository.getCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WeatherApp")),
      body: RefreshIndicator(
        onRefresh: () async {
          var request = repository.getCities();
          setState(() {
            listRequest = request;
          });
          await request;
        },
        child: FutureBuilder<List<WeatherCityItem>>(
            future: listRequest,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Hiba történt: ${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                var list = snapshot.data!;
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    return ListItem(list[i]);
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final WeatherCityItem item;

  const ListItem({super.key, required this.item});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 80,
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image(image: item.iconImage, fit: BoxFit.cover),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item.name, style: const TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          "${item.minTemp} - ${item.currentTemp} - ${item.maxTemp}")
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WindIcon(degree: item.windDegree),
                    Text("${item.windMagnitude} m/s"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
