import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VersiculoDelDia {
	static const _versiculoKey = 'versiculo_del_dia';
	static const _fechaKey = 'versiculo_fecha';
	static const _historialKey = 'versiculo_historial';
	static const _historialMax = 30;

	static Future<Map<String, dynamic>> obtenerVersiculo() async {
		final prefs = await SharedPreferences.getInstance();
		final hoy = DateTime.now().toIso8601String().substring(0, 10);

		// Cargar datos de la Biblia
		final versosData = await rootBundle.loadString('assets/data/biblia_versos.json');
		final librosData = await rootBundle.loadString('assets/data/biblia_libros.json');
		final versos = jsonDecode(versosData)['Versos'] as List;
		final libros = jsonDecode(librosData)['Libros'];

		// Si ya se eligió un versículo hoy
		if (prefs.getString(_fechaKey) == hoy) {
			final idGuardado = prefs.getInt(_versiculoKey);
			if (idGuardado != null) {
				final versiculo = versos.firstWhere((v) => v['id'] == idGuardado);
				final libro = libros.firstWhere((l) => l['id'] == versiculo['libro']);
				return {
					...versiculo,
					'referencia': '${libro['libro']} ${versiculo['capitulo']}:${versiculo['versiculo']}'
				};
			}
		}

		// Cargar historial de IDs ya usados
		List<int> historial = prefs.getStringList(_historialKey)?.map(int.parse).toList() ?? [];

		// Elegir un versículo aleatorio que no se haya usado recientemente
		final random = Random();
		late Map<String, dynamic> seleccionado;

		do {
			seleccionado = versos[random.nextInt(versos.length)];
		} while (historial.contains(seleccionado['id']) && historial.length < versos.length);

		// Guardar en historial
		historial.add(seleccionado['id']);
		if (historial.length > _historialMax) {
			historial = historial.sublist(historial.length - _historialMax);
		}

		// Guardar selección actual
		await prefs.setInt(_versiculoKey, seleccionado['id']);
		await prefs.setString(_fechaKey, hoy);
		await prefs.setStringList(_historialKey, historial.map((e) => e.toString()).toList());

		// Obtener nombre del libro para la referencia
		final libro = libros.firstWhere((l) => l['id'] == seleccionado['libro']);

		return {
			...seleccionado,
			'referencia': '${libro['libro']} ${seleccionado['capitulo']}:${seleccionado['versiculo']}'
		};
	}
}
