import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet, FlatList, TouchableOpacity } from 'react-native';

const CustomerForm = ({ onAddCustomer }) => {
  const [name, setName] = useState('');
  const [age, setAge] = useState('');
  const [phone, setPhone] = useState('');
  const [email, setEmail] = useState('');
  const [medicalHistory, setMedicalHistory] = useState('');

  const handleSubmit = () => {
    if (!name || !age || !phone) {
      alert('Please fill in all required fields (Name, Age, Phone)');
      return;
    }

    const newCustomer = {
      id: Date.now().toString(),
      name,
      age,
      phone,
      email,
      medicalHistory,
      createdAt: new Date().toISOString(),
    };

    onAddCustomer(newCustomer);
    
    // Reset form
    setName('');
    setAge('');
    setPhone('');
    setEmail('');
    setMedicalHistory('');
  };

  return (
    <View style={styles.formContainer}>
      <Text style={styles.title}>Add New Customer</Text>
      
      <TextInput
        style={styles.input}
        placeholder="Full Name *"
        value={name}
        onChangeText={setName}
      />
      
      <TextInput
        style={styles.input}
        placeholder="Age *"
        value={age}
        onChangeText={setAge}
        keyboardType="numeric"
      />
      
      <TextInput
        style={styles.input}
        placeholder="Phone Number *"
        value={phone}
        onChangeText={setPhone}
        keyboardType="phone-pad"
      />
      
      <TextInput
        style={styles.input}
        placeholder="Email"
        value={email}
        onChangeText={setEmail}
        keyboardType="email-address"
        autoCapitalize="none"
      />
      
      <TextInput
        style={[styles.input, styles.textArea]}
        placeholder="Medical History"
        value={medicalHistory}
        onChangeText={setMedicalHistory}
        multiline
        numberOfLines={4}
      />
      
      <TouchableOpacity style={styles.button} onPress={handleSubmit}>
        <Text style={styles.buttonText}>Add Customer</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  formContainer: {
    padding: 20,
    backgroundColor: '#fff',
    borderRadius: 10,
    margin: 10,
    elevation: 3,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 20,
    color: '#2c3e50',
    textAlign: 'center',
  },
  input: {
    borderWidth: 1,
    borderColor: '#ddd',
    borderRadius: 8,
    padding: 12,
    marginBottom: 15,
    fontSize: 16,
  },
  textArea: {
    height: 100,
    textAlignVertical: 'top',
  },
  button: {
    backgroundColor: '#3498db',
    padding: 15,
    borderRadius: 8,
    alignItems: 'center',
    marginTop: 10,
  },
  buttonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: 'bold',
  },
});

export default CustomerForm;
