import React from 'react';

import { StyleSheet } from 'react-native';

import InputPage from './components/InputPage';

export default class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      submitted: false
    };
  }

  onPress = () => {
    this.setState({submitted: !this.state.submitted});
    console.log(`Pressed! ${this.state.submitted}`);
  }

  render() {
    if (this.state.submitted) {
      return null;
    } else {
      return <InputPage onPress={this.onPress}/>;
    }
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
