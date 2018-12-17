import React from 'react';

import { StyleSheet } from 'react-native';

import Header from './components/Header';
import NumberInput from './components/NumberInput';
import InputPage from './components/InputPage';
import ResultPage from './components/ResultPage';

// Top-most component
export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      hours: null,
      minutes: null,
      rate: null,
      submitted: false
    };
  }

  // Logs a button press to the console
  logPress = () => {
    console.log(`Pressed a button! submitted: ${this.state.submitted}`);
  }

  // Submits the input page
  submit = () => {
    this.logPress();
    this.setState({submitted: true});
  }

  // Returns to the input page
  goBack = () => {
    this.logPress();
    this.setState({submitted: false});
  }

  render() {
    if (!this.state.submitted) {
      return <InputPage styles={styles} onPress={this.submit}/>;
    } else {
      return <ResultPage styles={styles} onPress={this.goBack}/>;
    }
  }
}

const styles = StyleSheet.create({
  app: {
    alignItems: 'center',
    backgroundColor: '#282923',
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'space-around',
    paddingTop: 10
  },
  button: {
    color: '#841584'
  }
});
