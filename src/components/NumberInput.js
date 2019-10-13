import React, { Button } from 'react';
const e = React.createElement;

import { Alert, StyleSheet, TextInput, View } from 'react-native';

export default class NumberInput extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      text: '',
      valid: false,
      value: null
    };
  }

  // Checks whether a string contains a non-negative number
  validate = (text) => {
    if (Number.isNaN(Number.parseFloat(text)))
      return false;
    else
      return (Number.parseFloat(text) >= 0) ? true : false;
  }

  // Handles input submission
  onEndEditing = () => {
    if (this.validate(this.state.text)) {
      console.log(`text: ${this.state.text} is valid`);
      this.setState({valid: true});
      console.log(`value: ${this.state.value}`);
    } else {
      console.log(`text: ${this.state.text} is invalid`);

      // If the text is invalid, but not undefined or blank
      if (this.state.text) {
        Alert.alert('Positive numbers only.');
      }

      this.setState({valid: false});
    }

    this.props.click(this.state.value);
  }

  render() {
    return (
      e(View, {},
        e(TextInput,
          {
            style: styles.container,
            onChangeText: (text) => {
              this.setState({text: text, value: Number.parseFloat(text)})
            },
            onEndEditing: this.onEndEditing,
            value: this.state.text,
            placeholder: this.props.field,
            keyboardType: 'numeric',
            returnKeyType: 'next'
          },
          null
        )
      )
    );
  }
}

const styles = StyleSheet.create({
  container: {
    borderColor: 'gray',
    borderWidth: 1,
    color: 'white',
    fontSize: 26,
    paddingLeft: 10,
    height: 62,
    width: 160
  }
});
