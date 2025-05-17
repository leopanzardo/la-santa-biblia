import 'package:flutter/material.dart';
import 'screens/versiculo_diario_screen.dart';
import 'screens/libros_screen.dart';
import 'screens/capitulos_screen.dart';
import 'screens/versos_screen.dart';
import 'styles/theme.dart';
import 'styles/scroll_behavior.dart';

void main() {
	runApp(const BibliaApp());
}

class BibliaApp extends StatelessWidget {
	const BibliaApp({super.key});

	@override
	Widget build(BuildContext context) {
		return ScrollConfiguration(
			behavior: CustomScrollBehavior(),
			child: MaterialApp(
				title: 'La Santa Biblia',
				theme: appTheme,
				debugShowCheckedModeBanner: false,
				initialRoute: '/',
				routes: {
					'/': (context) => const VersiculoDiarioScreen(),
					'/libros': (context) => const LibrosScreen(),
					'/capitulos': (context) => const CapitulosScreen(),
					'/versos': (context) => const VersosScreen(),
				},
			),
		);
	}
}
