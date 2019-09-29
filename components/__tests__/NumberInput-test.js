import React from 'react';
import renderer from 'react-test-renderer';

import NumberInput from '../NumberInput';

test.todo('test the input page');

 it(`renders correctly`, () => {
   const tree = renderer.create(
     <NumberInput/>
   ).toJSON();

   expect(tree).toMatchSnapshot();
 });
