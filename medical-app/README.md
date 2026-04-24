# Medical Mobile App

A React Native mobile application built with Expo for managing customer/patient data in a medical setting.

## Features

- **Add Customer Data**: Collect and store customer information including:
  - Full Name
  - Age
  - Phone Number
  - Email (optional)
  - Medical History (optional)

- **View Customer List**: Display all added customers in a clean, organized list
- **Delete Customers**: Remove customer records when needed
- **Responsive Design**: Works on both iOS and Android devices

## Project Structure

```
medical-app/
├── App.js                 # Main application entry point
├── app.json              # Expo configuration
├── package.json          # Dependencies and scripts
├── babel.config.js       # Babel configuration
├── src/
│   ├── components/
│   │   ├── CustomerForm.js    # Form to add new customers
│   │   └── CustomerList.js    # List display of all customers
│   └── screens/
│       └── HomeScreen.js      # Main home screen
└── README.md             # This file
```

## Getting Started

### Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- Expo CLI (optional, for advanced usage)

### Installation

1. Navigate to the project directory:
   ```bash
   cd medical-app
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm start
   ```

4. Run on your device:
   - Scan the QR code with the Expo Go app (iOS/Android)
   - Press `i` to run on iOS simulator
   - Press `a` to run on Android emulator
   - Press `w` to run in web browser

## Usage

1. **Add a Customer**: 
   - Fill in the required fields (Name, Age, Phone)
   - Optionally add Email and Medical History
   - Tap "Add Customer" button

2. **View Customers**: 
   - All added customers appear in the list below the form
   - Each customer card shows their details

3. **Delete a Customer**: 
   - Tap the "Delete" button on any customer card to remove them

## Technologies Used

- **React Native**: Cross-platform mobile development
- **Expo**: Development platform and tools
- **React Hooks**: useState for state management
- **FlatList**: Efficient list rendering

## Screenshots

The app features:
- A blue header with medical icon
- Clean white forms with shadow effects
- Card-based customer list layout
- Delete functionality for each record

## License

ISC

## Support

For issues or questions, please open an issue in the repository.
