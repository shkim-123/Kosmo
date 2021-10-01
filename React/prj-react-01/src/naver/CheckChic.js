import React, {useState} from 'react';

const CheckChic = () => {
    const [feNumber, setFeNumber] = useState(0);
    const [mNumber, setMNumber] = useState(0);

    const feAdd = () => {
        setFeNumber(feNumber+1);
    };
    const feMinus = () => {
        setFeNumber(feNumber-1);
    };
    const mAdd = () => {
        setMNumber(mNumber+1);
    };
    const mMinus = () => {
        setMNumber(mNumber-1);
    };

    return (
        <center>
            <div>총개수 : {feNumber+mNumber}</div>

            <button onClick = {feAdd}>+1</button>
            <button onClick = {feMinus}>-1</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button onClick = {mAdd}>+1</button>
            <button onClick = {mMinus}>-1</button>
            <br/>
            암병아리 : {feNumber}
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            숫병아리 : {mNumber}
        </center>
    )
}

export default CheckChic;