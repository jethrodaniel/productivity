import React, { Button } from 'react';

import { StyleSheet, TextInput, View } from 'react-native';

export default class NumberInput extends React.Component {
  constructor(props) {
    super(props);
    this.state = { text: '' };
  }

  render() {
    return (
      <View>
        <TextInput
          style={styles.container}
          onChangeText={(text) => { this.setState({text}) }}
          value={this.state.text}
          placeholder={this.props.field}
          keyboardType="numeric"
          returnKeyType="next"
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    borderColor: 'gray',
    borderWidth: 1,
    color: 'white',
    fontSize: 26,
    height: 62,
    width: 160
  }
});
