import React from 'react';
const e = React.createElement;

import { Text } from 'react-native';

export function MonoText(props) {
  return (
    e(Text, {style: [props.style, { fontFamily: 'space-mono' }], ...props})
  );
}
