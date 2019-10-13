import React from 'react';
const e = React.createElement;

import { Button, Platform, View } from 'react-native';

import NumberInput from './NumberInput';
import Header from './Header';

export default class InputPage extends React.Component {
  render() {
    return (
      e(View, {style: this.props.styles.app},
        e(Header, {msg: 'Enter scheduled time'}, null),
        e(NumberInput, {field: 'Hours', click: this.props.submitHours}, null),
        e(NumberInput, {field: 'Minutes', click: this.props.submitMinutes}, null),
        e(NumberInput, {field: 'Rate', click: this.props.submitRate}, null),
        e(Button,
          {
            onPress: this.props.onPress,
            title: 'Calculate',
            color: (Platform.OS === 'ios' ? 'black' : '#841584')
          },
          null
        )
      )
    );
  }
}
