import React, {useState} from 'react';

const CheckChic3 = () => {
    const [feNumber, setFeNumber] = useState(0);
    const [mNumber, setMNumber] = useState(0);

    const setNumber = (gender, number) => {
        // 만약 number 가 음수이고 숫/암병아리가 0 미만이면 경고하고 함수 중단하기
        if((number < 0 && feNumber == 0 && gender=="fe") || (number < 0 && mNumber == 0 && gender=="m")){
            alert("0미만의 수 입니다.");
            return;
        }

        if(gender === "fe"){
            setFeNumber(feNumber+number);
        } else {
            setMNumber(mNumber+number);
        }
    };

    return (
        <center>
            <div>총개수 : {feNumber+mNumber}</div>
            <button onClick = {setNumber.bind(setNumber, "fe", +1 )}>+1</button>
            <button onClick = {setNumber.bind(setNumber, "fe", -1 )}>-1</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button onClick = {setNumber.bind(setNumber, "m", +1 )}>+1</button>
            <button onClick = {setNumber.bind(setNumber, "m", -1 )}>-1</button>

            <br/>

            <button onClick = {() => {setNumber("fe", +1)}}>+1</button>
            <button onClick = {() => {setNumber("fe", -1)}}>-1</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button onClick = {() => {setNumber("m", +1)}}>+1</button>
            <button onClick = {() => {setNumber("m", -1)}}>-1</button>
            <br/>
            암병아리 : {feNumber}
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            숫병아리 : {mNumber}
        </center>
    )
}

export default CheckChic3;