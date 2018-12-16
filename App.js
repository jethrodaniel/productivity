import React from 'react';

import { StyleSheet } from 'react-native';

import Header from './components/Header';
import NumberInput from './components/NumberInput';
import InputPage from './components/InputPage';
import ResultPage from './components/ResultPage';

export default class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      submitted: false
    };
  }

  submit = () => {
    this.setState({submitted: true});
    console.log(`Pressed! ${this.state.submitted}`);
  }

  goBack = () => {
    this.setState({submitted: false});
    console.log(`Pressed! ${this.state.submitted}`);
  }

  render() {
    if (this.state.submitted) {
      return <ResultPage styles={styles} onPress={this.goBack}/>;
    } else {
      return <InputPage styles={styles} onPress={this.submit}/>;
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
  }
});
