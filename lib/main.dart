import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:spotify_flutter/components/layout_component.dart';
import 'package:spotify_flutter/provider/spotify_provider.dart';
import 'package:spotify_flutter/screens/artist_screen.dart';
import 'package:spotify_flutter/screens/player_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  ));
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderWidget());
}

class ProviderWidget extends StatelessWidget {
  const ProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SpotifyProvider(),
          lazy: false,
        )
      ],
      child: const StartupWidget(),
    );
  }
}

class StartupWidget extends StatelessWidget {
  const StartupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: 'home',
      routes: {
        'home': (_) => const LayoutComponent(),
        'player': (_) => const PlayerScreen(),
        'artist': (_) => const ArtistScreen(),
      },
    );
  }
}
