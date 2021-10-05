import React, {Component} from 'react'; // eslint-disable-line no-unused-vars

import {Route} from 'react-router-dom';
import Counter from './naver/Counter';
import Counter2 from './naver/Counter2';
import CheckChic from './naver/CheckChic';
import CheckChic2 from './naver/CheckChic2';
import CheckChic3 from './naver/CheckChic3';
import CheckChic4 from './naver/CheckChic4';
import RegData from './naver/RegData';
import RegData2 from './naver/RegData2';
import Search from './naver/Search';
import Search2 from './naver/Search2';
import Search5 from './naver/Search5';
import Test01 from './test/Test01';
import Test02 from './test/Test02';
import Test03 from './test/Test03';

function App() {
  return (
    <div>
      {/*---------------------------------------------------*/}
      {/* URL 주소가 ~:3000/naver/counter 일 경우 Counter 컴포넌트를 호출해라 */}
      {/*---------------------------------------------------*/}
      <Route path="/naver/counter" component = {Counter}/>
      <Route path="/naver/counter2" component = {Counter2}/>
      <Route path="/naver/checkChic" component = {CheckChic}/>
      <Route path="/naver/checkChic2" component = {CheckChic2}/>
      <Route path="/naver/checkChic3" component = {CheckChic3}/>
      <Route path="/naver/checkChic4" component = {CheckChic4}/>
      <Route path="/naver/regData" component = {RegData}/>
      <Route path="/naver/regData2" component = {RegData2}/>
      <Route path="/naver/search" component = {Search}/>
      <Route path="/naver/search2" component = {Search2}/>
      <Route path="/naver/search5" component = {Search5}/>
      <Route path="/test/test01" component = {Test01}/>
      <Route path="/test/test02" component = {Test02}/>
      <Route path="/test/test03" component = {Test03}/>
    </div>
  );
}

export default App;
