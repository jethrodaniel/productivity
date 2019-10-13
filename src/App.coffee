import React from 'react'
e = React.createElement

import { Alert, StyleSheet } from 'react-native'

import Header from './components/Header'
import NumberInput from './components/NumberInput'
import InputPage from './components/InputPage'
import ResultPage from './components/ResultPage'

export default class App extends React.Component
  constructor: (props) ->
    super props
    @state = submitted: false

  # Logs a button press to the console
  logPress: () =>
    console.log """
      Pressed a button! submitted: #{@state.submitted}

      hours:   #{@state.hours}
      minutes: #{@state.minutes}
      rate:    #{@state.rate}
    """

  # Submits the input page
  submit: () =>
    @logPress()

    valid = [
      @state.hours
      @state.minutes
      @state.rate
    ].every (n) => n? and n >= 0

    if valid
      @setState submitted: true
    else
      Alert.alert 'Fill out all fields first.'

  # Returns to the input page
  goBack: () =>
    @logPress()
    @setState
      submitted: false
      hours: null
      minutes: null
      rate: null

  render: ->
    unless @state.submitted
      e(InputPage,
        styles: styles
        submitHours: (hours) => @setState(hours: hours)
        submitMinutes: (minutes) => @setState(minutes: minutes)
        submitRate: (rate) => @setState(rate: rate)
        onPress: @submit,
        null
      )
    else
      e(ResultPage,
        styles: styles
        onPress: @goBack
        hours: @state.hours
        minutes: @state.minutes
        rate: @state.rate,
        null
      )

styles = StyleSheet.create(
  app:
    alignItems: 'center'
    backgroundColor: '#282923'
    flex: 1
    flexDirection: 'column'
    justifyContent: 'space-around'
    paddingTop: 10
  button:
    color: '#841584'
)
