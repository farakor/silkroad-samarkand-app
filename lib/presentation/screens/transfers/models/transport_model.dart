class TransportModel {
  final String name;
  final String description;
  final String imageUrl;
  final String capacity;
  final String features;
  final String priceNote;

  TransportModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.capacity,
    required this.features,
    required this.priceNote,
  });
}

// Тестовые данные для транспорта
List<TransportModel> getTransportList() {
  return [
    TransportModel(
      name: 'Автобус Higer',
      description: 'Наши автобусы Higer — это идеальное сочетание простора и комфорта.',
      imageUrl: 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      capacity: '45 мест',
      features: 'Кожаный салон, кондиционер, Wi-Fi, мультимедиа',
      priceNote: 'Цена по запросу',
    ),
    TransportModel(
      name: 'Микроавтобус Mercedes-Benz Sprinter',
      description: 'Максимальная вместимость: до 18 пассажиров',
      imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      capacity: '18 мест',
      features: 'Premium класс, кондиционер, USB-зарядка',
      priceNote: 'Цена по запросу',
    ),
    TransportModel(
      name: 'Микроавтобус Mercedes-Benz Sprinter',
      description: 'Максимальная вместимость: до 18 пассажиров',
      imageUrl: 'https://images.unsplash.com/photo-1586254669494-bafc7d5d35c7?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      capacity: '18 мест',
      features: 'Luxury класс, панорамная крыша, кожаные сидения',
      priceNote: 'Цена по запросу',
    ),
    TransportModel(
      name: 'Машина KIA Carnival',
      description: 'Максимальная вместимость: 8 мест',
      imageUrl: 'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      capacity: '8 мест',
      features: 'Семейный автомобиль, просторный салон, багажник',
      priceNote: 'Цена: 60-80 долларов',
    ),
    TransportModel(
      name: 'Honda EHR 5 (премиум)',
      description: 'Максимальная вместимость: 5 мест',
      imageUrl: 'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      capacity: '5 мест',
      features: 'Premium класс, кожаные сидения, климат-контроль',
      priceNote: 'Цена: 45-65 долларов',
    ),
    TransportModel(
      name: 'Honda EHR 5 (седан)',
      description: 'Максимальная вместимость: 5 мест',
      imageUrl: 'https://images.unsplash.com/photo-1502877338535-766e1452684a?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      capacity: '5 мест',
      features: 'Комфортабельный седан, кондиционер, USB',
      priceNote: 'Цена: 35-50 долларов',
    ),
  ];
} 