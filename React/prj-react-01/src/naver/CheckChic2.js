import React, {Component} from 'react';

class CheckChic2 extends Component {
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

    render(){
        const feNumber = this.state.feNumber;
        const mNumber = this.state.mNumber;

        return (
            <center>
                <div>총개수 : {feNumber+mNumber}</div>

                <button onClick = {this.feAdd}>+1</button>
                <button onClick = {this.feMinus}>-1</button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button onClick = {this.mAdd}>+1</button>
                <button onClick = {this.mMinus}>-1</button>
                <br/>
                암병아리 : {feNumber}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                숫병아리 : {mNumber}
            </center>
        )
    }
}

export default CheckChic2;