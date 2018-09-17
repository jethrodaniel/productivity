import React from 'react';
import {
  StyleSheet,
  Text,
  View } from 'react-native';

const Header = (props) => (
  <Text style={styles.header}>{props.message}</Text>
);

class InputPage extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Header message="Enter Scheduled Time" />
        <Text style={styles.header}>Yo!</Text>
      </View>
    );
  }
}


export default class App extends React.Component {
  render() {
    return (
      <View style={styles.app}>
        <InputPage />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  app: {
    flex: 1,
    backgroundColor: '#282923',
  },
  container: {
    alignItems: 'center',
    justifyContent: 'center',
  },
  header: {
    marginTop: 64,
    color: 'white',
    fontSize: 32,
    fontWeight: 'bold'
  }
});
