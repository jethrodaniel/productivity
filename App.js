import React, { Component } from 'react';
import {
  StyleSheet,
  Text,
  TextInput,
  View
} from 'react-native';

const Header = (props) => (
  <Text style={styles.header}>{props.message}</Text>
);

export class HourInput extends Component {
  constructor(props) {
    super(props);
    this.state = { text: '' };
  }

  render() {
    return (
      <View>
        <TextInput
          style={{width: 160, height: 62, borderColor: 'gray', borderWidth: 1, color: 'white', fontSize: 26}}
          onChangeText={(text) => this.setState({text})}
          value={this.state.text}
          placeholder="Hours"
          keyboardType="numeric"
          returnKeyType="next"
        />
      </View>
    );
  }
}

class InputPage extends React.Component {
  render() {
    return (
      <View style={{
        alignItems: 'center',
        flexDirection: 'column',
        justifyContent: 'space-around',
        flex: 1
      }}>

        <View>
          <Text style={{color: 'white', fontSize: 32}}>
            Enter scheduled time
          </Text>
        </View>
          <HourInput/>
          <HourInput/>
          <HourInput/>
      </View>
    );
  }
}

export default class App extends React.Component {
  render() {
    return (
      <View style={styles.app}>
        <InputPage/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  app: {
    flex: 1,
    backgroundColor: '#282923',
    paddingTop: 10,
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
