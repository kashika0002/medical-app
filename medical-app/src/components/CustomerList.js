import React from 'react';
import { View, Text, StyleSheet, FlatList, TouchableOpacity } from 'react-native';

const CustomerList = ({ customers, onDeleteCustomer }) => {
  const renderCustomer = ({ item }) => (
    <View style={styles.customerCard}>
      <View style={styles.customerHeader}>
        <Text style={styles.customerName}>{item.name}</Text>
        <Text style={styles.customerAge}>Age: {item.age}</Text>
      </View>
      
      <View style={styles.customerInfo}>
        <Text style={styles.label}>Phone:</Text>
        <Text style={styles.value}>{item.phone}</Text>
      </View>
      
      {item.email ? (
        <View style={styles.customerInfo}>
          <Text style={styles.label}>Email:</Text>
          <Text style={styles.value}>{item.email}</Text>
        </View>
      ) : null}
      
      {item.medicalHistory ? (
        <View style={styles.customerInfo}>
          <Text style={styles.label}>Medical History:</Text>
          <Text style={styles.value}>{item.medicalHistory}</Text>
        </View>
      ) : null}
      
      <View style={styles.customerFooter}>
        <Text style={styles.date}>
          Added: {new Date(item.createdAt).toLocaleDateString()}
        </Text>
        <TouchableOpacity 
          style={styles.deleteButton}
          onPress={() => onDeleteCustomer(item.id)}
        >
          <Text style={styles.deleteButtonText}>Delete</Text>
        </TouchableOpacity>
      </View>
    </View>
  );

  if (customers.length === 0) {
    return (
      <View style={styles.emptyContainer}>
        <Text style={styles.emptyText}>No customers added yet</Text>
        <Text style={styles.emptySubtext}>Add your first customer using the form above</Text>
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Customer List ({customers.length})</Text>
      <FlatList
        data={customers}
        renderItem={renderCustomer}
        keyExtractor={(item) => item.id}
        contentContainerStyle={styles.listContent}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 10,
  },
  title: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 15,
    color: '#2c3e50',
    textAlign: 'center',
  },
  listContent: {
    paddingBottom: 20,
  },
  customerCard: {
    backgroundColor: '#fff',
    borderRadius: 10,
    padding: 15,
    marginVertical: 8,
    marginHorizontal: 10,
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
  },
  customerHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 10,
    borderBottomWidth: 1,
    borderBottomColor: '#eee',
    paddingBottom: 10,
  },
  customerName: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#2c3e50',
  },
  customerAge: {
    fontSize: 16,
    color: '#7f8c8d',
    backgroundColor: '#ecf0f1',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 15,
  },
  customerInfo: {
    flexDirection: 'row',
    marginBottom: 8,
  },
  label: {
    fontSize: 14,
    fontWeight: '600',
    color: '#34495e',
    width: 120,
  },
  value: {
    fontSize: 14,
    color: '#2c3e50',
    flex: 1,
  },
  customerFooter: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginTop: 10,
    paddingTop: 10,
    borderTopWidth: 1,
    borderTopColor: '#eee',
  },
  date: {
    fontSize: 12,
    color: '#95a5a6',
  },
  deleteButton: {
    backgroundColor: '#e74c3c',
    paddingHorizontal: 15,
    paddingVertical: 6,
    borderRadius: 5,
  },
  deleteButtonText: {
    color: '#fff',
    fontSize: 12,
    fontWeight: 'bold',
  },
  emptyContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 40,
  },
  emptyText: {
    fontSize: 18,
    color: '#7f8c8d',
    marginBottom: 10,
  },
  emptySubtext: {
    fontSize: 14,
    color: '#bdc3c7',
    textAlign: 'center',
  },
});

export default CustomerList;
