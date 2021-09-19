# 0.1 Container + Column

```dart
return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              "The Main Menu of a\nLegendary Game",
              textAlign: TextAlign.center,
            ),
          ),
          // TODO 0.2 Menu items
        ],
      ),
    );
```

# 0.2 Menu items

```dart
Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0),
  child: const Text( // TODO 0.3 Gesture detector
    "New Game",
    textAlign: TextAlign.center,
  ),
),
const Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0),
  child: Text(
    "Load Game",
    textAlign: TextAlign.center,
  ),
),
const Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0),
  child: Text(
    "Exit",
    textAlign: TextAlign.center,
  ),
),
```

# 0.3 Gesture detector

```dart
GestureDetector(
  child: const Text(
    "New Game",
    textAlign: TextAlign.center,
  ),
  onTap: () {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation) {
        return Center(
          child: Container(
            width: 200,
            height: 200,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: const SizedBox(
              width: 200,
              height: 200,
              child: Center(
                child: Text("New Game clicked"),
              ),
            ),
          ),
        );
      },
    );
  },
),
```

# 1.1 MaterialApp

```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.green,
    visualDensity: VisualDensity.adaptivePlatformDensity,

  ),
  home: Scaffold(
    appBar: AppBar(
      leading: const Text("Leading widget"), // TODO 1.2 Icon
      title: const Text("App title"),
      actions: const [
        Text("Action1"),
        Text("Action2")
      ],
    ),
  ),
);
```

# 1.2 Icon

```dart
leading: const Icon(Icons.arrow_back),
```

# 4.1 Text parameters

```dart
Text(
  '$_counter',
  style: const TextStyle(
    color: Colors.red,
    fontSize: 32,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.dotted,
  ),
),
```

# 4.2 Row of Icons

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisSize: MainAxisSize.min,
  children: const [
    Icon(
      Icons.android,
      color: Colors.greenAccent,
      size: 40,
    ),
    Icon(
      Icons.alarm,
      color: Colors.orangeAccent,
      size: 40,
    ),
  ],
),
```

# 4.3 AssetImage, Image.asset

```dart
 const Image(
   image: AssetImage('assets/images/logo_flutter.png'),
   height: 100,
 ),
Image.asset(
  'assets/images/logo_flutter.png',
  height: 100,
),
```



# 4.4 Image.network

```dart
Image.network(
  "https://picsum.photos/150",
  color: Colors.red,
  colorBlendMode: BlendMode.colorBurn,
  headers: const {
    "Authorization": "Bearer 0123456789"
  },
  // TODO 4.5 Image laoding indicator
),
```

# 4.5 Image laoding indicator

```dart
Image.network(
  "https://picsum.photos/150",
  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  },
),
```

# 4.6 SizedBox

```dart
SizedBox(
  width: 80,
  height: 20,
  child: Container(
    color: Colors.brown,
  )
),
```

# 4.7 Container

```dart
Container(
  margin: const EdgeInsets.all(16),
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    shape: BoxShape.rectangle,
    border: Border.all(
      color: Colors.black,
      width: 8,
    ),
    color: Colors.blueGrey,
    borderRadius: BorderRadius.circular(8)
  ),
  alignment: Alignment.center,
  child: ...
)
```

# 4.8 Stack

```dart
Stack(
  children: [
    Container(...),
    Positioned(
      left: 250,
      top: 230,
      child: Image.asset(
        'assets/images/logo_flutter.png',
        height: 100,
      ),
    ),
  ]
),
```

