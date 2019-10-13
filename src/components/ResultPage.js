import React from 'react';
const e = React.createElement;

import {
  Button,
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';

import NumberInput from './NumberInput';
import Header from './Header';

const Heading = (props) => {
  return (
    e(View, {},
      e(Text, {style: styles.heading}, props.msg)
    )
  );
}

function scheduledTime(hours, minutes) {
  return `Scheduled time:
    ${hours} hours, ${minutes} minutes
  `;
}

function requires(hours, minutes, rate) {
  let inital = hours * 60 + minutes;
  let additional = inital * ((100 - rate) / 100);

  hours = Math.floor(additional / 60);
  minutes = Math.floor(additional % 60);

  return `${rate}% productivity requires an additional:
    ${hours} hours, ${minutes} minutes
  `;
}

function totalTime(hours, minutes, rate) {
  let inital = hours * 60 + minutes;
  let additional = inital * ((100 - rate) / 100);

  let total = inital + additional;

  hours = Math.floor(total / 60);
  minutes = Math.floor(total % 60);

  return `Total Time:
    ${hours} hours, ${minutes} minutes
  `;
}

export default class ResultPage extends React.Component {
  render() {
    return (
      e(View, {style: this.props.styles.app},
        e(Header, {msg: 'Results'}, null),
        e(Heading, {msg: scheduledTime(this.props.hours, this.props.minutes)}, null),
        e(Heading, {msg: requires(this.props.hours, this.props.minutes, this.props.rate)}, null),
        e(Heading, {msg: totalTime(this.props.hours, this.props.minutes, this.props.rate)}, null),
        e(Button,
          {
            onPress: this.props.onPress,
            title: "Enter another input",
            color: (Platform.OS === 'ios' ? 'black' : '#841584')
          },
          null
        )
      )
    );
  }
}

const styles = StyleSheet.create({
  heading: {
    color: 'white',
    fontSize: 20,
    width: 300
  }
});