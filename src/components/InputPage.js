import React from 'react';

import { Button, Platform, View } from 'react-native';

import NumberInput from './NumberInput';
import Header from './Header';

export default class InputPage extends React.Component {
  render() {
    return (
      React.createElement(
        View,
        {style: this.props.styles.app},
        React.createElement(Header, {msg: 'Enter scheduled time'}, null),
        React.createElement(
          NumberInput,
          {field: 'Hours', click: this.props.submitHours},
          null
        ),
        React.createElement(
          NumberInput,
          {field: 'Minutes', click: this.props.submitMinutes},
          null
        ),
        React.createElement(
          NumberInput,
          {field: 'Rate', click: this.props.submitRate},
          null
        ),
        React.createElement(
          Button,
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
