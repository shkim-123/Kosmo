import React, {Component} from 'react';

class CheckChic4 extends Component {
    state = {
        feNumber : 0
        ,mNumber : 0
    }

    feAdd = () => {
        this.setState({feNumber:this.state.feNumber+1})
    };

    feMinus = () => {
        this.setState({feNumber:this.state.feNumber-1})
    };
    
    mAdd = () => {
        this.setState({mNumber:this.state.mNumber+1})
    };
    
    mMinus = () => {
        this.setState({mNumber:this.state.mNumber-1})
    };

    setNumber = (gender, number) => {
        // 만약 number 가 음수이고 숫/암병아리가 0 미만이면 경고하고 함수 중단하기
        const feNumber = this.state.feNumber;
        const mNumber = this.state.mNumber;

        if((number < 0 && feNumber === 0 && gender==="fe") || (number < 0 && mNumber === 0 && gender==="m")){
            alert("0미만의 수 입니다.");
            return;
        }

        if(gender === "fe"){
            this.setState({feNumber:feNumber+number});
        } else {
            this.setState({mNumber:mNumber+number});
        }
    };

    render(){
        const feNumber = this.state.feNumber;
        const mNumber = this.state.mNumber;

        return (
            <center>
                <div>총개수 : {feNumber+mNumber}</div>

                <button onClick = {() => {this.setNumber("fe", +1)}}>+1</button>
                <button onClick = {() => {this.setNumber("fe", -1)}}>-1</button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button onClick = {() => {this.setNumber("m", +1)}}>+1</button>
                <button onClick = {() => {this.setNumber("m", -1)}}>-1</button>
                <br/>
                암병아리 : {feNumber}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                숫병아리 : {mNumber}
            </center>
        )
    }
}

export default CheckChic4;