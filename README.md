# 📖 La Santa Biblia

Una aplicación móvil desarrollada con Flutter que te permite leer la Biblia completa en español, con un versículo destacado cada día, una interfaz elegante e inspirada en el estilo santoral, y navegación simple por libros, capítulos y versículos.

---

## ✨ Características

- 📅 **Versículo del día**: se selecciona uno al azar sin repetir recientes, y se guarda para cada fecha.
- 📚 **Lectura por libros y capítulos**: navegación fluida por todos los libros de la Biblia en español.
- 💬 **Versículos con formato**: se respeta el formato original con negritas, itálicas y párrafos mediante HTML.
- 🎨 **Diseño visual refinado**: incluye degradados, tipografías clásicas (como *Tangerine* y *EB Garamond*) y una portada de estilo gótico como ícono.
- 📜 **Subtítulos dinámicos**: indican claramente dónde está el usuario dentro de la lectura.
- 🔝 **Botón "Volver arriba"**: aparece automáticamente al hacer scroll prolongado en listas largas.
- 🧭 **Interfaz responsiva**: se adapta a pantallas pequeñas, medianas y grandes.
- 📦 **Sin conexión**: toda la información de la Biblia se encuentra embebida en archivos JSON locales.

---

## 📱 Capturas de pantalla

*Próximamente...*

---

## 🛠️ Tecnologías utilizadas

- [Flutter](https://flutter.dev/) 3.19.6
- Dart
- [flutter_html](https://pub.dev/packages/flutter_html)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- Assets personalizados en `/assets/images/` y `/assets/data/`

---

## 📂 Estructura del proyecto

```
lib/
├── main.dart
├── styles/
│ ├── theme.dart
│ └── scroll_behavior.dart
├── widgets/
│ ├── header_title.dart
│ ├── subtitulo_ubicacion.dart
│ └── scroll_to_top_button.dart
├── screens/
│ ├── versiculo_diario_screen.dart
│ ├── libros_screen.dart
│ ├── capitulos_screen.dart
│ └── versos_screen.dart
└── utils/
└── versiculo_utils.dart
```

---

## 🚀 Cómo compilar

```
flutter clean
flutter pub get
flutter build apk --release
```

Para instalarlo en un dispositivo conectado:

```
adb install -r build/app/outputs/apk/release/la_santa_biblia.apk
```

## 📌 Notas adicionales

- El versículo del día se guarda usando SharedPreferences, evitando repeticiones recientes.
- El scroll tiene rebote (bouncing) activado, con comportamiento personalizado.
- La fuente BlackKnightFLF se utiliza en el encabezado de la app y se carga desde assets.

## 👥 Autores y créditos

- **Leonardo Panzardo**
  - 👨‍💻 Senior Full Stack Software Engineer
  - 📍 Montevideo, Uruguay
  - 📂 [GitHub](https://github.com/leopanzardo)
  - 📬 [LinkedIn](https://www.linkedin.com/in/leopanzardo/)

Iconografía, diseño, interfaz y desarrollo general por Leonardo Panzardo. 
Tipografías utilizadas: Tangerine, EB Garamond y BlackKnightFLF. 
Imagen de portada generada con inteligencia artificial (prompt engineering). 
Texto bíblico proveniente de fuente libre (archivos JSON). 

---

## 📄 Licencia

Este proyecto está licenciado bajo los términos de la MIT License.

---

## 📚 Créditos

Creado con ❤️ por Leonardo Panzardo.


¡Gracias por visitar este repositorio! 🙏 Si te resulta útil, no dudes en dejar una ⭐️.

