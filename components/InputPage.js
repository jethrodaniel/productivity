import React from 'react';

import { Button, Platform, View } from 'react-native';

import NumberInput from './NumberInput';
import Header from './Header';

export default class InputPage extends React.Component {
  render() {
    return (
      <View style={this.props.styles.app}>
        <Header msg={'Enter scheduled time'}/>
        <NumberInput field={'Hours'} click={this.props.submitHours}/>
        <NumberInput field={'Minutes'} click={this.props.submitMinutes}/>
        <NumberInput field={'Rate'} click={this.props.submitRate}/>
        <Button
          onPress={this.props.onPress}
          title='Calculate'
          color={Platform.OS === 'ios' ? 'black' : '#841584' }
        />
      </View>
    );
  }
}
