import React from 'react';

import {
  Button,
  Text,
  View
} from 'react-native';

import NumberInput from './NumberInput';
import Header from './Header';

export default class ResultPage extends React.Component {
  render() {
    return (
      <View style={this.props.styles.app}>
        <Header msg={'Results'}/>
        <Button
          onPress={this.props.onPress}
          title="Enter another input"
        />
      </View>
    );
  }
}
