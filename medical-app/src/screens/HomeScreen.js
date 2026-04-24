import React, { useState } from 'react';
import { StyleSheet, View, SafeAreaView, StatusBar, ScrollView } from 'react-native';
import CustomerForm from '../components/CustomerForm';
import CustomerList from '../components/CustomerList';

export default function HomeScreen() {
  const [customers, setCustomers] = useState([]);

  const handleAddCustomer = (customer) => {
    setCustomers((prevCustomers) => [customer, ...prevCustomers]);
  };

  const handleDeleteCustomer = (customerId) => {
    setCustomers((prevCustomers) => 
      prevCustomers.filter((customer) => customer.id !== customerId)
    );
  };

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="dark-content" backgroundColor="#3498db" />
      <View style={styles.header}>
        <View style={styles.headerContent}>
          <View style={styles.logoContainer}>
            <Text style={styles.logoIcon}>🏥</Text>
          </View>
          <View style={styles.titleContainer}>
            <Text style={styles.title}>Medical App</Text>
            <Text style={styles.subtitle}>Customer Management</Text>
          </View>
        </View>
      </View>
      
      <ScrollView style={styles.scrollView} showsVerticalScrollIndicator={false}>
        <CustomerForm onAddCustomer={handleAddCustomer} />
        <CustomerList 
          customers={customers} 
          onDeleteCustomer={handleDeleteCustomer} 
        />
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f6fa',
  },
  header: {
    backgroundColor: '#3498db',
    paddingTop: 10,
    paddingBottom: 20,
    paddingHorizontal: 20,
    elevation: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 4,
  },
  headerContent: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  logoContainer: {
    backgroundColor: '#fff',
    borderRadius: 50,
    padding: 10,
    marginRight: 15,
  },
  logoIcon: {
    fontSize: 32,
  },
  titleContainer: {
    flex: 1,
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#fff',
  },
  subtitle: {
    fontSize: 14,
    color: '#ecf0f1',
    marginTop: 4,
  },
  scrollView: {
    flex: 1,
  },
});
