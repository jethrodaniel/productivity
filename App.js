import React from 'react';

import { Alert, StyleSheet } from 'react-native';

import Header from './components/Header';
import NumberInput from './components/NumberInput';
import InputPage from './components/InputPage';
import ResultPage from './components/ResultPage';

// Top-most component
export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = { submitted: false };
  }

  // Logs a button press to the console
  logPress = () => {
    console.log(`
      Pressed a button! submitted: ${this.state.submitted}

      hours: ${this.state.hours}
      minutes: ${this.state.minutes}
      rate: ${this.state.rate}
    `);
  }

  // Submits the input page
  submit = () => {
    this.logPress();

    if (this.state.hours && this.state.minutes && this.state.rate)
      this.setState({submitted: true});
    else
      Alert.alert('Fill out all fields first.');
  }

  // Returns to the input page
  goBack = () => {
    this.logPress();
    this.setState({
      submitted: false,
      hours: null,
      minutes: null,
      rate: null
    });
  }

  render() {
    if (!this.state.submitted) {
      return (
        <InputPage
          styles={styles}
          submitHours={(hours) => this.setState({hours})}
          submitMinutes={(minutes) => this.setState({minutes})}
          submitRate={(rate) => this.setState({rate})}
          onPress={this.submit}
        />
      );
    } else {
      return (
        <ResultPage
          styles={styles}
          onPress={this.goBack}
          hours={this.state.hours}
          minutes={this.state.minutes}
          rate={this.state.rate}
        />
      );
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
