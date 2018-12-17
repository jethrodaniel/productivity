import React from 'react';

import { Button, Platform, View } from 'react-native';

import NumberInput from './NumberInput';
import Header from './Header';

export default class InputPage extends React.Component {
  render() {
    return (
      <View style={this.props.styles.app}>
        <Header msg={'Enter scheduled time'}/>
        <NumberInput field={'Hours'}/>
        <NumberInput field={'Minutes'}/>
        <NumberInput field={'Rate'}/>
        <Button
          onPress={this.props.onPress}
          title='Calculate'
          color={Platform.OS === 'ios' ? 'black' : '#841584' }
        />
      </View>
    );
  }
}
