//=======================================================================
// 프로젝트명 /node_modules/react 안에 default 가 붙어 수출하는 
//      컴포넌트를 수입해서 현재 파일 안에서 React 란 이름으로 사용
// 프로젝트명 /node_modules/react 안에 default 가 안 붙어 수출하는 
//      useState 컴포넌트를 수입해서 현재 파일 안에서 useState 란 이름으로 사용
//----------------------------------------------------------
// <참고> 아래 수입 코드는 함수 컴포넌트가 선언되는 js 파일 안에서는 필수로 수입되는 컴포넌트들이다.
//=======================================================================
import React, {Component} from 'react';

//=======================================================================
// 리액트의 단위 프로그램 중 하나인 [클래스 컴포넌트] 선언하기
//=======================================================================
class RegData2 extends Component {

    // 속성변수 nameRef 선언, React 객체의 createRef() 메소드를 호출하여 리턴된 데이터 저장하기
    // 이후부터 ref={this.nameRef} 가진 태그는 this.nameRef.current.focus(); 코딩이 실행되면
    // 포커스가 그 태그 안으로 들어간다.
    nameRef = React.createRef();

    // 속성변수 names 선언하고 Array 객체 저장하기
    names = [ {id : 1, text: '사오정'}
         ,{id: 2, text: '저팔계'}
         ,{id: 3, text: '손오공'}
         ,{id: 4, text: '삼장법사'} ];
    
    //----------------------------------------------------------
    // 리액트가 제공하는 state 속성변수 선언하고 [사용자 정의 객체]를 저장하기
    // 클래스 컴포넌트 안에서 리액트가 제공하는 state 속성변수 특징
    // state 속성변수의 갱신은 리액트가 제공하는 setState 메소드 호출로만 가능하다.
    // setState 메소드 호출로 state 속성변수 안의 값이 갱신되면 render 메소드가 재 호출된다.
    // state 속성변수 호출할 경우 this. 을 붙인다.     
    //----------------------------------------------------------
    state = {
        names : this.names                  // 이름 목록 저장
        ,inputText : ''                     // 입력 데이터 저장
        ,nextId : this.names.length+1       // 추가 저장될 데이터의 고유값
    };
   
    textChange = e => {
        // setState 라는 메소드 호출하여 state 변수 안에 저장된 사용자 정의 객체 안의
        // 속성변수 inputText 안의 데이터를 val 안의 데이터로 갱신하라
        // <주의> state 변수 안에 저장된 사용자 정의 객체가 {inputText:val}로 완전
        // 갱신 된게 절대 아니다. 즉, 부분 갱신만 진행된 것이다.
        this.setState({inputText: e.target.value});
    };

    keyPress = e => {
        if(e.key == 'Enter'){
            this.add();
        }
    };

    //----------------------------------------------------------
    // 화살표 함수가 저장된 지역변수 add 선언
    // 화살표 함수 안에는 추가 버튼 클릭 시 호출되는 실행 구문을 내포하고 있다.
    //----------------------------------------------------------
    add = () => {
        // 지역변수 선언하고 state 속성변수 안의 사용자 정의 객체 안의 데이터를 저장하기
        // <주의> 지역변수 inputText는 공백 제거 예정이므로 변수 왼쪽에 const를 사용하지 않는다.
        let inputText = this.state.inputText; 
        const names = this.state.names;
        const nextId = this.state.nextId;

        // 만약, 비어있으면 경고하고 함수 중단.
        if(inputText == null || inputText == undefined || inputText.split(" ").join("") == ""){
            alert("값을 입력해 주세요.");
            this.setState({inputText: ''});
            this.nameRef.current.focus();
            return;
        }

        inputText = inputText.trim();

        // String 객체 메소드 호출 전 null 은 아닌지 확인
        if(names != null){
           // 지역변수 tmpNames 선언하고 Array 객체의 filter 메소드를 호출하여
           // names에 저장된 사용자 정의 객체를 1개씩 꺼내서 아래의 화살표 함수를 호출하여 
           // 리턴되는 데이터가 true 일때만 기존 사용자 정의 객체만 복사해 누적하기
           const tmpNames = names.filter(name => name.text === inputText);
           if(tmpNames.length > 0) {
               alert("중복된 값입니다.");
               this.setState({inputText: ''});
               this.nameRef.current.focus();
               return;
           }
        }
        
        // 지역변수 newNames 선언하고 names 안의 Array 객체 복사하고 
        // {id:nextId, text: inputText} 추가하기
        const newNames = names.concat({
            id:nextId, text: inputText
        });

        // newNames 안의 Array 객체를 기존 names 안에 갱신해서 저장하기
        this.setState({names:newNames});
        // 사용자정의 객체 안의 nextId 속성변수에 nextId+1 의 실행결과 저장하기. 
        // 즉, 기존 데이터에서 1 증가하란 의미
        this.setState({nextId:nextId+1});
        // 사용자정의 객체 안의 inputText 속성변수에 "" 저장하기. 즉, 입력양식이 비어지게 된다.
        this.setState({inputText: ''});
        this.nameRef.current.focus();
    };

    remove = (id) => {
        const names = this.state.names;
        if(names.length < 2){
            alert("최소 1개는 있어야 합니다. 삭제할 수 없습니다.");
            return;
        }

        // 지역변수 nextNames 선언하고 Array 객체의 filter 메소드를 호출하여
        // names 에 저장된 사용자 정의 객체를 1개씩 꺼내서 아래의 화살표 함수를 호출하여
        // 리턴되는 데이터가 true 일때만 사용자 정의 객체만 복사해 누적하기
        // 즉, 매개변수로 들어온 id와 같지 않은 객체만 골라서 누적하기
        const nextNames = names.filter(name => name.id != id);
        
        // // state 속성변수에 저장된 사용자정의 객체 안의 names 를 nextNames로 갱신하기
        this.setState({names:nextNames});
    };

    
    
    render(){
        //----------------------------------------------------------
        // 지역변수 namesTag 선언하고 Array 객체의 map 메소드를 호출하여
        // names에 저장된 사용자정의 객체를 1개씩 꺼내서 아래의 화살표 함수를 호출하여
        // 리턴되는 html 코딩을 누적해 저장하기
        //----------------------------------------------------------
        const namesTag = this.state.names.map(
            name => 
                <li style={{cursor: 'pointer'}} key={name.id} onDoubleClick={()=>this.remove(name.id)}>
                    {name.text}
                </li>
        );

        //----------------------------------------------------------
        // JSX 문법을 가진 return 구문 선언
        // 리턴되는 JSX 문법이 결국 웹화면에 출력된다.
        //----------------------------------------------------------
        return (
            <center>
                <table><tr><td>
                <input 
                    type="text" 
                    ref = {this.nameRef}
                    onKeyPress = {this.keyPress}
                    value={this.state.inputText} // value 속성값으로 state 속성변수 안의 inputText 속성변수 안의 데이터를 삽입하기 
                    onChange={this.textChange}   // 입력값이 바뀌면, 즉, 키보드로 데이터를 입력하면
                /> &nbsp;
                <button 
                    onClick={this.add}           // 버튼 클릭하면 add 변수 안의 화살표함수 호출하기
                >추가</button>
                <ul>{namesTag}</ul>
                </td></tr></table>
            </center>
        )
    }
};

export default RegData2;