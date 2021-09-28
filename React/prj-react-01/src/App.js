import React, {Component} from 'react'; // eslint-disable-line no-unused-vars

import {Route} from 'react-router-dom';
import Counter from './naver/Counter';
import Counter2 from './naver/Counter2';

function App() {
  return (
    <div>
      {/*---------------------------------------------------*/}
      {/* URL 주소가 ~:3000/naver/counter 일 경우 Counter 컴포넌트를 호출해라 */}
      {/*---------------------------------------------------*/}
      <Route path="/naver/counter" component = {Counter}/>
      <Route path="/naver/counter2" component = {Counter2}/>
    </div>
  );
}

export default App;
