import React, {Component} from 'react'; // eslint-disable-line no-unused-vars

import {Route} from 'react-router-dom';
import Counter from './naver/Counter';

function App() {
  return (
    <div>
      {/*---------------------------------------------------*/}
      {/* URL 주소가 ~:3000/naver/counter 일 경우 Counter 컴포넌트를 호출해라 */}
      {/*---------------------------------------------------*/}
      <Route path="/naver/counter" component = {Counter}/>
    </div>
  );
}

export default App;
