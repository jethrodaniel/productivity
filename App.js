import React, { Component, Button } from 'react';

import {
  StyleSheet,
  Text,
  TextInput,
  View
} from 'react-native';

import HourInput from './components/HourInput';

// const Header = (props) => (
//   <Text style={styles.header}>{props.message}</Text>
// );

export default class App extends React.Component {
  render() {
    return (
      <View style={styles.app}>

        <View>
          <Text style={{color: 'white', fontSize: 32}}>
            Enter scheduled time
          </Text>
        </View>

        <HourInput/>
        <HourInput/>
        <HourInput/>

        </View >
    );
  }
}

const styles = StyleSheet.create({
  app: {
    alignItems: 'center',
    flexDirection: 'column',
    justifyContent: 'space-around',
    flex: 1,
    backgroundColor: '#282923',
    paddingTop: 10
  },
  header: {
    marginTop: 64,
    color: 'white',
    fontSize: 64,
    fontWeight: 'bold',
    flex: 3,
    backgroundColor: 'yellow'
  }
});
