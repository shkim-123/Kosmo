//=======================================================================
// 프로젝트명 /node_modules/react 안에 default 가 붙어 수출하는 
//      컴포넌트를 수입해서 현재 파일 안에서 React 란 이름으로 사용
// 프로젝트명 /node_modules/react 안에 default 가 안 붙어 수출하는 
//      useState 컴포넌트를 수입해서 현재 파일 안에서 useState 란 이름으로 사용
//----------------------------------------------------------
// <참고> 아래 수입 코드는 함수 컴포넌트가 선언되는 js 파일 안에서는 필수로 수입되는 컴포넌트들이다.
//=======================================================================
import React, {useState, useRef} from 'react';

//=======================================================================
// 리액트의 단위 프로그램 중 하나인 [함수 컴포넌트] 선언하기
//=======================================================================
const RegData = () => {

    //----------------------------------------------------------
    // 지역변수 nameRef 선언하고 useRef 함수를 호출하여 리턴된 데이터를 저장하기
    // 이후부터 ref={nameRef} 를 가진 태그는 nameRef.current.focus(); 코딩이 실행되면 
    // 포커스가 그 태그 안으로 들어간다.
    //----------------------------------------------------------
    const nameRef = useRef(null);

    //----------------------------------------------------------
    // 지역변수 names, setNames 선언 후 지역변수 names에는 Array 객체 저장
    // 지역변수 setNames 에는 지역변수 names 안을 갱신하는 익명함수 저장하기
    // 이후 부터 setNames(~) 이 호출되면 함수 컴포넌트 안에 있는 코딩이 재실행된다.
    // 재 실행 시 useState 함수 호출이 있는 코딩 줄은 재 호출에서 제외된다.
    // 이제부터 names는 마치 클래스 컴포넌트의 state 속성변수와 동일한 성격을 가지게 된다.
    //----------------------------------------------------------
    const [names, setNames] = useState([
        {id : 1, text: '사오정'}
        ,{id: 2, text: '저팔계'}
        ,{id: 3, text: '손오공'}
        ,{id: 4, text: '삼장법사'}
    ]);
    const [inputText, setInputText] = useState('');
    const [nextId, setNextId] = useState(names.length+1);
    //----------------------------------------------------------
    
    //----------------------------------------------------------
    // 화살표 함수가 저장된 지역변수 textChange 선언
    // 아래 매개변수 e 에는 Event 객체가 들어온다. 
    // 즉, 아래 화살표함수는 입력 양식에 이벤트가 발생했을 때 실행할 구문을 내포하고 있다. 
    //----------------------------------------------------------
    const textChange = e => {
        // 지역변수 val 선언하고 이벤트가 발생한 객체의 value 값을 저장하기
        // <참고> value 속성을 가진 태그는 입력양식 뿐이다.
        let val = e.target.value;
        
        // 앞 뒤 공백 제거하고 저장하기1
        val = val.trim();
        
        // 앞 뒤 공백 제거하고 저장하기2
        /*
        while(val.indexOf(" ") == 0){  // 코드에 에러있음
            val = val.substring(1);
        }
        while(val.lastIndexOf(" ") == val.length-1){
            val = val.substring(0, val.length-1);
        }
        */

        setInputText(val);
    };
    
    //----------------------------------------------------------
    // 화살표 함수가 저장된 지역변수 add 선언
    // 화살표 함수 안에는 추가 버튼 클릭 시 호출되는 실행 구문을 내포하고 있다.
    //----------------------------------------------------------
    const add = () => {
        // 만약, 비어있으면 경고하고 함수 중단.
        if(inputText === null || inputText === undefined || inputText.split(" ").join("") === ""){
            alert("값을 입력해 주세요.");
            setInputText("");

            // ref={nameRef} 를 가진 태그에 포커스 넣기
            nameRef.current.focus();
            return;
        }

        // String 객체 메소드 호출 전 null 은 아닌지 확인
        if(names !== null){
            /*
            // 만약, 중복되어 있으면 경고하고 함수 중단
            for(let i = 0; i < names.length; i++){
                if(inputText == names[i].text){
                    alert("중복된 값입니다.");
                    setInputText("");
                    return; 
                }
            }
            */
           // 지역변수 tmpNames 선언하고 Array 객체의 filter 메소드를 호출하여
           // names에 저장된 사용자 정의 객체를 1개씩 꺼내서 아래의 화살표 함수를 호출하여 
           // 리턴되는 데이터가 true 일때만 기존 사용자 정의 객체만 복사해 누적하기
           const tmpNames = names.filter(name => name.text === inputText);
           if(tmpNames.length > 0) {
               alert("중복된 값입니다.");
               setInputText("");
               // ref={nameRef} 를 가진 태그에 포커스 넣기
               nameRef.current.focus();
               return;
           }
        }
        
        // 지역변수 newNames 선언하고 names 안의 Array 객체 복사하고 
        // {id:nextId, text: inputText} 추가하기
        const newNames = names.concat({
            id:nextId, text: inputText
        });

        // newNames 안의 Array 객체를 기존 names 안에 갱신해서 저장하기
        setNames(newNames);
        // nextId 지역변수에 nextId+1 의 실행결과 저장하기. 즉, 기존 데이터에서 1 증가하란 의미
        setNextId(nextId+1);
        // inputText 지역변수에 "" 저장하기. 즉, 입력양식이 비어지게 된다.
        setInputText("");

        // ref={nameRef} 를 가진 태그에 포커스 넣기
        nameRef.current.focus();
    };
    
    //----------------------------------------------------------
    // 화살표 함수가 저장된 지역변수 remove 선언
    // 화살표 함수 안에는 목록을 더블클릭하면 목록을 삭제하는 구문이 내포되어 있다.
    // 매개변수로 더블클릭하는 목록의 고유값인 id 값이 들어온다. 
    //----------------------------------------------------------
    const remove = (id) => {
        /*
        let index = 0;
        // 매개변수로 들어온 id를 가진 사용자 정의 객체를 삭제한 후 저장
        for(let i = 0; i < names.length; i++){
            if(names[i].id == id){
                index = i;
            }
        }
        names.splice(index,1)
        setNames(names);
        */

        // 지역변수 nextNames 선언하고 Array 객체의 filter 메소드를 호출하여
        // names 에 저장된 사용자 정의 객체를 1개씩 꺼내서 아래의 화살표 함수를 호출하여
        // 리턴되는 데이터가 true 일때만 사용자 정의 객체만 복사해 누적하기
        // 즉, 매개변수로 들어온 id와 같지 않은 객체만 골라서 누적하기
        const nextNames = names.filter(name => name.id !== id);

        // names 지역변수에 nextNames 안의 Array 객체로 갱신하기
        setNames(nextNames);
    };

    //----------------------------------------------------------
    // 지역변수 namesTag 선언하고 Array 객체의 map 메소드를 호출하여
    // names에 저장된 사용자정의 객체를 1개씩 꺼내서 아래의 화살표 함수를 호출하여
    // 리턴되는 html 코딩을 누적해 저장하기
    //----------------------------------------------------------
    const namesTag = names.map(
        name => 
            <li style={{cursor: 'pointer'}} key={name.id} onDoubleClick={()=>remove(name.id)}>
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
                ref={nameRef}
                value={inputText}       // value 속성값으로 지역변수 inputText 안의 데이터 삽입하기 
                onChange={textChange}   // 입력값이 바뀌면, 즉, 키보드로 데이터를 입력하면
            /> &nbsp;
            <button 
                onClick={add}           // 버튼 클릭하면 add 변수 안의 화살표함수 호출하기
            >추가</button>
            <ul>{namesTag}</ul>
            </td></tr></table>
        </center>
    )
};

export default RegData;