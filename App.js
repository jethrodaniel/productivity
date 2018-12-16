import React, { Button } from 'react';

import {
  StyleSheet,
  Text,
  TextInput,
  View
} from 'react-native';

import NumberInput from './components/NumberInput';

const Header = (props) => (
  <View>
    <Text style={styles.header}>
     {props.msg}
    </Text>
  </View>
);

export default class App extends React.Component {
  render() {
    return (
      <View style={styles.app}>
        <Header msg={'Enter scheduled time'}/>
        <NumberInput field={'Hours'}/>
        <NumberInput field={'Minutes'}/>
        <NumberInput field={'Rate'}/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  header: {
    color: 'white',
    fontSize: 32
  },
  app: {
    alignItems: 'center',
    backgroundColor: '#282923',
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'space-around',
    paddingTop: 10
  }
});
