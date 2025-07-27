# 🏛️ Silkroad Samarkand Touristic Centre App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-blue?logo=dart)
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-lightgrey)
![License](https://img.shields.io/badge/License-MIT-green)

**Официальное мобильное приложение для туристического центра "Silkroad Samarkand"**

*Современное кроссплатформенное приложение для Android и iOS, созданное с использованием Flutter*

[📱 Скачать для Android](#) • [🍎 Скачать для iOS](#) • [📖 Документация](#) • [🐛 Сообщить об ошибке](https://github.com/farakor/silkroad-samarkand-app/issues)

</div>

---

## 🌟 Особенности

- **🌍 Многоязычность**: Поддержка узбекского, русского и английского языков
- **🎨 Современный дизайн**: Красивый UI/UX с анимациями и переходами
- **📱 Кроссплатформенность**: Одинаково работает на iOS и Android
- **🔍 Персонализация**: Smart scenario для рекомендаций на основе интересов
- **⚡ Высокая производительность**: Оптимизированная архитектура Flutter
- **🎭 Анимации**: Плавные переходы и интерактивные элементы

## 🏗️ Технологический стек

### Frontend (Mobile)
- **Framework**: Flutter 3.0+ (Dart)
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Network**: Dio + Pretty Logger
- **Storage**: Hive + Shared Preferences
- **Animations**: flutter_staggered_animations, Lottie
- **UI**: Google Fonts, SVG, Cached Network Images
- **Localization**: flutter_localizations

### Design System
- **🎨 Основной цвет**: `#A08B54` (золотистый)
- **🔵 Вторичный цвет**: `#071E3F` (темно-синий)
- **📝 Шрифт**: Helvetica Neue LT W1G
- **✨ Анимации**: Современные переходы и эффекты

## 📱 Экраны приложения

### ✅ Этап 1 - Базовая навигация (ЗАВЕРШЕН)

| Экран | Статус | Описание |
|-------|--------|----------|
| 🚀 **Splash Screen** | ✅ | Анимированный экран загрузки с логотипом |
| 🌐 **Language Selection** | ✅ | Выбор языка (Узбекский, Русский, Английский) |
| 🔐 **Authentication** | ✅ | Логин/регистрация с опцией пропуска |
| ❤️ **Interests Selection** | ✅ | Smart scenario для выбора интересов пользователя |
| 🏠 **Main Screen** | ✅ | Placeholder для главного экрана |

### 🔄 Следующие этапы

- **🎪 Events Screen** - Карусель событий и мероприятий
- **🏨 Hotels Screen** - Каталог отелей с бронированием
- **🌿 Eco Village** - Экологические туры и активности
- **🍽️ Restaurants & Food** - Рестораны, бары, лаунжи
- **💆 SPA & Wellness** - СПА услуги и оздоровление
- **🎮 Entertainment** - Развлечения и активности
- **🛎️ Concierge Services** - Консьерж услуги
- **👤 Profile Screen** - Профиль пользователя

## 🚀 Быстрый старт

### 📋 Требования

- **Flutter SDK**: 3.0.0 или выше
- **Dart SDK**: 3.0.0 или выше
- **IDE**: Android Studio / VS Code с Flutter плагином
- **Эмулятор**: iOS Simulator / Android Emulator

### ⚡ Установка и запуск

1. **Клонирование репозитория:**
```bash
git clone https://github.com/farakor/silkroad-samarkand-app.git
cd silkroad-samarkand-app
```

2. **Установка зависимостей:**
```bash
flutter pub get
```

3. **Запуск приложения:**
```bash
# Режим отладки
flutter run --debug

# Режим релиза
flutter run --release
```

4. **Сборка для продакшена:**
```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

## 📁 Архитектура проекта

```
lib/
├── 🎯 core/
│   └── theme/
│       ├── app_colors.dart      # 🎨 Цветовая схема
│       ├── app_typography.dart  # 📝 Типографика
│       └── app_theme.dart       # 🎭 Основная тема
├── 📱 presentation/
│   └── screens/
│       ├── splash/              # 🚀 Экран загрузки
│       ├── language_selection/  # 🌐 Выбор языка
│       ├── auth/               # 🔐 Аутентификация
│       ├── interests/          # ❤️ Выбор интересов
│       ├── main/              # 🏠 Главный экран
│       ├── events/            # 🎪 События
│       ├── hotels/            # 🏨 Отели
│       ├── eco_village/       # 🌿 Эко-деревня
│       ├── profile/           # 👤 Профиль
│       └── navigation/        # 🧭 Навигация
└── main.dart                   # 🎯 Точка входа
```

## 🎯 Roadmap

### Фаза 1: Базовая функциональность ✅
- [x] Splash screen с анимацией
- [x] Выбор языка интерфейса
- [x] Система аутентификации
- [x] Выбор интересов пользователя
- [x] Базовая навигация

### Фаза 2: Основной контент 🔄
- [ ] Главный экран с категориями
- [ ] Каталог событий и мероприятий
- [ ] Каталог отелей
- [ ] Рестораны и развлечения
- [ ] СПА и wellness услуги

### Фаза 3: Интеграции 📅
- [ ] Backend API интеграция
- [ ] Система бронирования отелей
- [ ] Резервация ресторанов
- [ ] Покупка билетов на события
- [ ] Push уведомления

### Фаза 4: Дополнительные функции 🚀
- [ ] Карты и навигация
- [ ] Отзывы и рейтинги
- [ ] Социальные функции
- [ ] Офлайн режим
- [ ] AR функции

## 🤝 Контрибьюция

Мы приветствуем любой вклад в развитие проекта! 

1. **Fork** репозиторий
2. Создайте **feature branch** (`git checkout -b feature/amazing-feature`)
3. **Commit** ваши изменения (`git commit -m 'Add amazing feature'`)
4. **Push** в branch (`git push origin feature/amazing-feature`)
5. Откройте **Pull Request**

## 📄 Лицензия

Этот проект лицензирован под MIT License - смотрите [LICENSE](LICENSE) файл для деталей.

## 📞 Контакты

**Silkroad Samarkand Touristic Centre**
- 🌐 Website: [silkroadsamarkand.com](#)
- 📧 Email: info@silkroadsamarkand.com
- 📱 Phone: +998 XX XXX XX XX
- 📍 Address: Samarkand, Uzbekistan

---

<div align="center">

**⭐ Поставьте звезду, если вам нравится проект!**

*Разработано с ❤️ для туристов Самарканда*

</div> 