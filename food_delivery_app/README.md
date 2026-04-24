# 🍔 Food Delivery App - MVP

A lightweight, modern food delivery mobile app built with Flutter and Firebase, featuring a clean Zomato-style UI.

## ✨ Features

### User Features
- 🔐 **Phone OTP Authentication** - Login/Signup using Firebase Auth
- 📍 **Location-Based** - Shows restaurants based on city
- 🍔 **Restaurant Listing** - Browse restaurants with ratings & delivery time
- 🔍 **Search** - Find restaurants by name or cuisine
- 🍽️ **Menu Display** - View menu items with prices and images
- 🛒 **Shopping Cart** - Add/remove items, update quantities
- 📦 **Order Placement** - Cash on Delivery, order tracking
- ✅ **Order Confirmation** - Success screen with order details

### Admin Features (via Firebase Console)
- ➕ Add/Edit restaurants manually in Firestore
- ➕ Add/Edit menu items manually in Firestore

## 🎨 UI/UX

- Clean, modern Zomato-inspired design
- White + Red color theme
- Card-based restaurant layout
- Smooth scrolling and animations
- Mobile-first responsive design

## 🏗️ Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase
  - Authentication (Phone OTP)
  - Firestore Database
  - Cloud Functions (optional for future)
- **State Management**: Provider
- **Image Caching**: cached_network_image

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── restaurant.dart
│   ├── menu_item.dart
│   ├── cart.dart
│   └── order.dart
├── screens/                  # UI screens
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── restaurant_menu_screen.dart
│   ├── cart_screen.dart
│   ├── checkout_screen.dart
│   └── order_success_screen.dart
├── widgets/                  # Reusable widgets
│   ├── restaurant_card.dart
│   ├── menu_item_card.dart
│   ├── custom_search_bar.dart
│   └── common_widgets.dart
├── services/                 # Business logic
│   ├── firebase_service.dart
│   └── auth_service.dart
├── providers/                # State management
│   └── cart_provider.dart
└── theme/                    # App theming
    └── app_theme.dart
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Firebase account
- Android Studio / VS Code
- Physical device or emulator

### Installation

1. **Clone the repository**
   ```bash
   cd food_delivery_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Setup Firebase**
   
   Follow the detailed setup guide in [FIREBASE_SETUP.md](FIREBASE_SETUP.md)
   
   - Create Firebase project
   - Add Android/iOS apps
   - Download configuration files
   - Enable Authentication and Firestore

4. **Run the app**
   ```bash
   flutter run
   ```

## 🧪 Testing

### Demo Credentials
- **Phone Number**: Any 10-digit number
- **OTP**: `123456`

### Sample Data

Add these to your Firestore database:

**Restaurant Document:**
```json
{
  "name": "Pizza Palace",
  "imageUrl": "https://images.unsplash.com/photo-1513104890138-7c749659a591",
  "rating": 4.5,
  "deliveryTime": "30-40 mins",
  "cuisine": "Italian, Pizza",
  "city": "Mumbai"
}
```

**Menu Item Document:**
```json
{
  "restaurantId": "<restaurant_id>",
  "name": "Margherita Pizza",
  "description": "Classic pizza with fresh basil and mozzarella",
  "price": 299,
  "imageUrl": "https://images.unsplash.com/photo-1574071318508-1cdbab80d002",
  "isVeg": true
}
```

## 📱 Screenshots

The app includes the following screens:

1. **Login Screen** - Phone OTP authentication
2. **Home Screen** - Restaurant list with search
3. **Restaurant Menu** - Menu items with add to cart
4. **Cart Screen** - Review and manage cart items
5. **Checkout Screen** - Enter delivery address
6. **Order Success** - Confirmation with order details

## 🎯 Key Features Explained

### Authentication
- Phone number OTP-based login
- Demo mode accepts any phone with OTP `123456`
- Session persistence via Firebase Auth

### Restaurant Discovery
- Location-based filtering (by city)
- Real-time search functionality
- Rating and delivery time display

### Shopping Cart
- Persistent cart during session
- Quantity management
- Real-time total calculation

### Order Flow
- Simple checkout process
- Cash on Delivery only (MVP)
- Order saved to Firestore
- Success confirmation screen

## 🔧 Configuration

### Firebase Setup
See [FIREBASE_SETUP.md](FIREBASE_SETUP.md) for detailed instructions.

### Theme Customization
Edit `lib/theme/app_theme.dart` to customize colors and styling.

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.24.0
  firebase_auth: ^4.16.0
  cloud_firestore: ^4.14.0
  provider: ^6.1.1
  cached_network_image: ^3.3.1
  geolocator: ^10.1.0
```

## 🚫 Excluded Features (MVP Scope)

As per requirements, the following are NOT included:
- ❌ Delivery boy system
- ❌ Live order tracking
- ❌ Payment gateway (COD only)
- ❌ Complex filters
- ❌ Reviews/ratings system
- ❌ Multiple cities selection
- ❌ User profile management

## 🔮 Future Enhancements

Potential features for next iteration:
- [ ] Push notifications for order updates
- [ ] Order history screen
- [ ] Multiple payment methods
- [ ] Real-time order tracking
- [ ] Advanced filters (cuisine, rating, price)
- [ ] Favorites/Wishlist
- [ ] Promo codes and discounts
- [ ] Multi-language support
- [ ] Dark mode

## 🐛 Troubleshooting

### Common Issues

**App crashes on startup:**
- Ensure Firebase configuration files are in place
- Check that Firebase is initialized in `main.dart`

**OTP not working:**
- Add test phone numbers in Firebase Console
- Use the demo OTP `123456`

**No restaurants showing:**
- Add sample data to Firestore `restaurants` collection
- Check Firestore security rules

**Build errors:**
- Run `flutter clean` and `flutter pub get`
- Update Firebase dependencies

## 📄 License

This project is created for educational/demo purposes.

## 🤝 Contributing

This is an MVP template. Feel free to fork and enhance!

## 📞 Support

For issues or questions:
- Check [FIREBASE_SETUP.md](FIREBASE_SETUP.md)
- Review [FlutterFire Documentation](https://firebase.flutter.dev/)
- Check [Firebase Documentation](https://firebase.google.com/docs)

---

**Built with ❤️ using Flutter and Firebase**
