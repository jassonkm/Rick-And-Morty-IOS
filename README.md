# 🧪 Challenge App Rick & Morty - Swift - iOS

Aplicación creada como ejercicio técnico, basada en la API pública de **Rick & Morty**, desarrollada en **Swift** siguiendo los principios de **Clean Architecture** y **MVVM**, con persistencia local, asincronía moderna y una interfaz totalmente declarativa con **SwiftUI**.

---

## 🧱 Arquitectura

### 🧩 Patrón utilizado
**MVVM (Model - View - ViewModel)** + **Clean Architecture**

Separación clara por capas:
- **Domain** → Modelos de negocio y casos de uso (`UseCases`)
- **Data** → Repositorios y data sources (remoto / local)
- **Presentation** → ViewModels y vistas (`SwiftUI`)
- **DI** → Contenedor de dependencias (manual, inspirado en Hilt/Dagger)

---

## 🧠 Stack Tecnológico

| Concepto | Android (Kotlin) | iOS (Swift) |
|-----------|------------------|-------------|
| UI declarativa | Jetpack Compose | SwiftUI |
| Arquitectura | MVVM | MVVM |
| Async / Corrutinas | `Coroutines` + `Flow` | `async/await` + `Task` |
| Persistencia local | Room | SwiftData |
| Inyección de dependencias | Dagger Hilt | Dependency Container manual |
| Networking | Retrofit2 | URLSession + Codable |
| LiveData / Flow | StateFlow / LiveData | @Published + ObservableObject |
| Manejo de errores | Try/Catch + Flow | Do/Try/Catch + async throws |
| Caché offline | Room | SwiftData |

---

## ⚙️ Tecnologías principales

- ✅ **Swift 5.10**
- ✅ **iOS 17+**
- ✅ **SwiftUI** – UI declarativa
- ✅ **SwiftData** – Persistencia local (equivalente a Room)
- ✅ **async/await** – Concurrencia estructurada
- ✅ **URLSession + Codable** – Networking moderno
- ✅ **MVVM + Clean Architecture**
- ✅ **Dependency Injection (manual DI container)**
- ✅ **Scroll infinito + caché offline**




