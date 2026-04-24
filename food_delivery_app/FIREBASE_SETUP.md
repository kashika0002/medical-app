# Food Delivery App - Firebase Setup Guide

## 📋 Prerequisites

1. **Firebase Account**: Create a free account at [firebase.google.com](https://firebase.google.com)
2. **Flutter SDK**: Ensure Flutter is installed on your system

---

## 🔥 Firebase Project Setup

### Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project"
3. Enter project name (e.g., "food-delivery-app")
4. Disable Google Analytics (optional for MVP)
5. Click "Create project"

---

## 📱 Android Configuration

### Step 2: Add Android App to Firebase

1. In Firebase Console, click the Android icon
2. Enter your Android package name: `com.fooddelivery.app`
3. Enter app nickname (optional)
4. Download `google-services.json`
5. Place it in: `android/app/google-services.json`

### Step 3: Update Android Build Files

**android/build.gradle** (project level):
```gradle
buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.4.0'
    }
}
```

**android/app/build.gradle** (app level):
```gradle
apply plugin: 'com.android.application'
apply plugin: 'com.google.gms.google-services'

android {
    defaultConfig {
        applicationId "com.fooddelivery.app"
        minSdkVersion 21
        targetSdkVersion 34
    }
}

dependencies {
    implementation platform('com.google.firebase:firebase-bom:32.7.0')
    implementation 'com.google.firebase:firebase-auth'
    implementation 'com.google.firebase:firebase-firestore'
}
```

---

## 🍎 iOS Configuration

### Step 4: Add iOS App to Firebase

1. In Firebase Console, click the iOS icon
2. Enter your iOS bundle ID: `com.fooddelivery.app`
3. Download `GoogleService-Info.plist`
4. Place it in: `ios/Runner/GoogleService-Info.plist`

### Step 5: Update iOS Podfile

**ios/Podfile**:
```ruby
platform :ios, '12.0'

target 'Runner' do
  use_frameworks!
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
end
```

Then run:
```bash
cd ios
pod install
```

---

## 🔐 Enable Firebase Services

### Step 6: Enable Authentication

1. Go to Firebase Console → Authentication
2. Click "Get Started"
3. Enable "Phone" sign-in method
4. For testing, add test phone numbers with OTP codes

### Step 7: Create Firestore Database

1. Go to Firebase Console → Firestore Database
2. Click "Create database"
3. Start in **test mode** (for development)
4. Choose a location close to your users

### Step 8: Set Firestore Security Rules

For MVP development, use these rules:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow read/write to all collections for development
    match /{document=**} {
      allow read, write: if request.time < timestamp.date(2025, 12, 31);
    }
  }
}
```

**⚠️ IMPORTANT**: Update rules for production!

---

## 📊 Database Structure

### Collections to Create:

#### 1. `restaurants` Collection
```
restaurants/
  └─ {restaurantId}/
      ├─ name: "Pizza Hut"
      ├─ imageUrl: "https://..."
      ├─ rating: 4.5
      ├─ deliveryTime: "30-40 mins"
      ├─ cuisine: "Italian, Pizza"
      └─ city: "Mumbai"
```

#### 2. `menuItems` Collection
```
menuItems/
  └─ {itemId}/
      ├─ restaurantId: "{restaurantId}"
      ├─ name: "Margherita Pizza"
      ├─ description: "Classic cheese pizza"
      ├─ price: 299
      ├─ imageUrl: "https://..."
      └─ isVeg: true
```

#### 3. `orders` Collection
```
orders/
  └─ {orderId}/
      ├─ userId: "user123"
      ├─ restaurantId: "{restaurantId}"
      ├─ restaurantName: "Pizza Hut"
      ├─ items: [
      │   {
      │     menuItemId: "item1",
      │     name: "Margherita Pizza",
      │     price: 299,
      │     quantity: 2
      │   }
      │ ]
      ├─ totalAmount: 598
      ├─ status: "pending"
      ├─ createdAt: Timestamp
      └─ deliveryAddress: "123 Street, Mumbai"
```

---

## 🌾 Add Sample Data

### Sample Restaurant:
```json
{
  "name": "Burger King",
  "imageUrl": "https://images.unsplash.com/photo-1571091718767-18b5b1457add",
  "rating": 4.3,
  "deliveryTime": "25-35 mins",
  "cuisine": "American, Burgers",
  "city": "Mumbai"
}
```

### Sample Menu Item:
```json
{
  "restaurantId": "restaurant_id_here",
  "name": "Whopper Burger",
  "description": "Flame-grilled beef patty with fresh vegetables",
  "price": 199,
  "imageUrl": "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
  "isVeg": false
}
```

---

## 🚀 Running the App

### 1. Install Dependencies
```bash
cd food_delivery_app
flutter pub get
```

### 2. Run the App
```bash
flutter run
```

---

## 🧪 Testing

### Test Phone Number Setup:
1. Firebase Console → Authentication → Sign-in method → Phone
2. Add test phone numbers (e.g., +1 650-555-3434)
3. Set test OTP codes (e.g., 123456)

### Demo Login:
- Enter any 10-digit phone number
- Use OTP: **123456**

---

## 📝 Next Steps for Production

1. **Update Firestore Security Rules** for proper authentication
2. **Add proper error handling** and logging
3. **Implement proper user authentication** flow
4. **Add push notifications** for order updates
5. **Set up Firebase Hosting** for web version
6. **Add analytics** and crash reporting
7. **Implement proper state management** for larger apps

---

## 🛠️ Troubleshooting

### Common Issues:

**"FirebaseException: No Firebase App"**
- Ensure `google-services.json` is in `android/app/`
- Check `build.gradle` has Google Services plugin

**"Permission denied" in Firestore**
- Check security rules
- Ensure database is in test mode for development

**OTP not working**
- Verify phone number format with country code
- Check test phone numbers in Firebase Console

---

## 📞 Support

For issues, check:
- [Firebase Documentation](https://firebase.google.com/docs)
- [FlutterFire Documentation](https://firebase.flutter.dev/)
