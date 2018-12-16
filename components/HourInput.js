import React, { Component, Button } from 'react';

import {
  StyleSheet,
  Text,
  TextInput,
  View
} from 'react-native';

export default class HourInput extends Component {
  constructor(props) {
    super(props);
    this.state = { text: '' };
  }

  render() {
    return (
      <View>
        <TextInput
          style={styles.container}
          onChangeText={ (text) => { this.setState({text})} }
          value={this.state.text}
          placeholder="Hours"
          keyboardType="numeric"
          returnKeyType="next"
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    width: 160,
    height: 62,
    borderColor: 'gray',
    borderWidth: 1,
    color: 'white',
    fontSize: 26
  }
});
