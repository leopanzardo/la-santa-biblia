import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF2980B9);   // Celeste oscuro
const Color secondaryColor = Color(0xFF85C1E9); // Celeste claro
const Color highlightColor = Color(0xFFF4D03F); // Dorado suave
const Color backgroundColor = Colors.white;
const Color textColor = Colors.black87;

final ThemeData appTheme = ThemeData(
	brightness: Brightness.light,
	scaffoldBackgroundColor: backgroundColor,
	primaryColor: primaryColor,
	splashColor: secondaryColor.withOpacity(0.3),
	appBarTheme: const AppBarTheme(
		backgroundColor: Colors.transparent,
		elevation: 0,
		foregroundColor: Colors.white,
	),
	textTheme: const TextTheme(
		// Título decorativo principal (usado en Header)
		headlineLarge: TextStyle(
			fontFamily: 'BlackKnight',
			fontSize: 40,
			color: Colors.white,
			shadows: [
				Shadow(
					offset: Offset(1, 1),
					blurRadius: 2,
					color: Colors.black45,
				)
			],
		),

		// Títulos grandes, como "Versículo del Día"
		headlineSmall: TextStyle(
			fontFamily: 'Tangerine',
			fontWeight: FontWeight.w700,
			fontSize: 40,
			color: primaryColor,
		),

		// Títulos secundarios, como nombre del libro o capítulo
		titleLarge: TextStyle(
			fontFamily: 'EBGaramond',
			fontWeight: FontWeight.w600,
			fontStyle: FontStyle.italic,
			fontSize: 24,
			color: primaryColor,
		),

		// Texto general de los versículos
		bodyMedium: TextStyle(
			fontFamily: 'EBGaramond',
			fontWeight: FontWeight.w400,
			fontStyle: FontStyle.italic,
			fontSize: 20,
			height: 1.5,
			color: textColor,
		),
	),
	elevatedButtonTheme: ElevatedButtonThemeData(
		style: ElevatedButton.styleFrom(
			backgroundColor: primaryColor,
			foregroundColor: Colors.white,
			padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
			textStyle: TextStyle(
				fontSize: 20,
				fontWeight: FontWeight.w600,
				fontFamily: 'EBGaramond',
			),
			shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
		),
	),
);
