import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false; // Temanın başlangıç değeri (açık)

  // Açık tema yapılandırması
  final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Karanlık tema yapılandırması
  final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Tema geçişini sağlayan fonksiyon
  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme; // Temayı değiştir
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? darkTheme : lightTheme, // Aktif temayı seç
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tema Geçiş Uygulaması"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Şu anda ${isDarkTheme ? "Karanlık Tema" : "Açık Tema"} kullanılıyor.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: toggleTheme, // Tema geçişi için buton
                child: Text("Temayı Değiştir"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
