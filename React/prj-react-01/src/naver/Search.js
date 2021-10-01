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
const Search = () => {

    //----------------------------------------------------------
    // 지역변수 devRef 선언하고 useRef 함수를 호출하여 리턴된 데이터를 저장하기
    // 이후부터 ref={devRef} 가진 태그는 devRef.current.focus(); 코딩이 실행되면
    // 포커스가 그 태그 안으로 들어간다.
    const devRef = useRef(null);
    //----------------------------------------------------------

    //----------------------------------------------------------
    // 지역변수 developerList 선언하고 Array 객체 저장, 개발자의 목록이 저장되어 있다.
    // 실제로는 DB에서 가져와야 한다.
    const developerList = [
        {dev_no : 1, dev_name: '사오정'  , addr: '서울시', phone:'010-1234-1234'}
        ,{dev_no: 2, dev_name: '저팔계'  , addr: '부산시', phone:'010-1111-1234'}
        ,{dev_no: 3, dev_name: '손오공'  , addr: '대구시', phone:'010-3333-1234'}
        ,{dev_no: 4, dev_name: '삼장법사', addr: '울산시', phone:'010-4444-1234'}
        ,{dev_no: 5, dev_name: '오공이'  , addr: '광주시', phone:'010-5555-1234'}
        ,{dev_no: 6, dev_name: '나무늘보', addr: '서울시', phone:'010-6666-1234'}
        ,{dev_no: 7, dev_name: '비바비바', addr: '서울시', phone:'010-7777-1234'}
    ];
    //----------------------------------------------------------
    
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // 지역변수 developers, setDevelopers 선언하고 지역변수 developers 에는 [~] 즉, Array 객체 저장하기
    // 지역변수 setDevelopers 에는 지역변수 developers 안을 갱신하는 익명함수 저장하기
    // 이후부터 setDevelopers(~)이 호출되면 함수 컴포넌트 안의 코딩이 재 실행된다.
    // 재 실행 시 useState 함수 호출이 있는 코딩줄은 재 실행에서 제외된다.
    // 이제부터 developers 는 마치 클래스 컴포넌트의 state 속성변수와 동일한 성격을 가지게 된다.
    const [developers, setDevelopers] = useState(developerList);
    const [inputText, setInputText] = useState('');
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    //----------------------------------------------------------
    // 화살표 함수가 저장된 지역변수 textChange 선언. 아래 매개변수 e 에는 Event 객체가 들어온다.
    // 즉, 아래 화살표 함수는 입력 양식에 이벤트가 발생했을 때 실행할 구문을 내포하고 있다.
    const textChange = e => setInputText(e.target.value);
    //----------------------------------------------------------
    
    //----------------------------------------------------------
    const keyPress = e => {
        if(e.key == "Enter"){
            search();
        }
    }
    //----------------------------------------------------------
    
    //----------------------------------------------------------
    // 화살표 함수가 저장된 지역변수 search 선언. 검색 버튼 누르면 실행할 구문을 내포하고 있다.
    const search = () => {
        // 지역변수 tmp_inputText 선언 후, 
        // inputText 안의 문자 복사한 후 앞 뒤 공백 제거 후 tmp_inputText 에 저장하기
        let tmp_inputText = inputText.trim();

        // 지역변수 inputText 안에 tmp_inputText 저장하기
        setInputText(tmp_inputText);
        
        if(tmp_inputText == null || tmp_inputText == undefined || tmp_inputText.split(" ").join("") == ""){
            alert("값을 입력해 주세요.");
            setInputText("");

            // ref={devRef} 를 가진 태그에 포커스 넣기
            devRef.current.focus();
            return;
        }

        if(tmp_inputText != null){
            //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // 지역변수 searchDevs 선언하고 Array 객체의 filter 메소드를 호출하여 
            // developerList에 저장된 사용자 정의 객체를 1개씩 복사하여 꺼내서
            // 화살표 함수를 호출하면서 매개변수로 전달시킨다.
            // 화살표 함수의 리턴값이 true면 매개변수로 들어온 사용자 정의 객체를 누적시킨다.
            // 즉, 입력한 키워드가 부분적으로 들어있는 사용자 정의 객체만 누적시킨다. 
            // 즉, searchDevs 안에는 키워드가 들어 있는 사용자 정의 객체만 모여있는 Array 객체가 저장되어 있다. 
            let searchDevs = developerList.filter(
                dev => dev.dev_name.indexOf(tmp_inputText) >= 0
                || dev.addr.indexOf(tmp_inputText) >= 0
                || dev.phone.indexOf(tmp_inputText) >= 0
            );
            //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            // searchDevs 안의 Array 객체 setDevelopers 지역변수 안에 저장하기
            // 즉, 키워드가 들어 있는 사용정 객체들이 새롭게 developers 지역변수 안에 들어간 것이다.
            setDevelopers(searchDevs);

            // ref={devRef} 를 가진 태그에 포커스 넣기
            devRef.current.focus();
        }
    };
    //----------------------------------------------------------

    //----------------------------------------------------------
    // 화살표 함수가 저장된 지역변수 searchAll 선언. 모두검색 버튼 누르면 실행할 구문을 내포하고 있다.
    const searchAll = () => {
        // 지역변수 InputText 안에 "" 저장하기
        // 즉, 키워드 입력란 비우기
        setInputText("");
        devRef.current.focus();
        // developerList 안에 Array 객체를 developers 지역변수 안에 저장하기
        // 즉, 원래 모든 데이터가 복구되는 셈이다.
        setDevelopers(developerList);
    };
    //----------------------------------------------------------

    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // 지역변수 developersTag 선언. 
    // developers 안에 저장된 사용자 정의 객체 안의 데이터를 html 태그 형태로 누적시키기  
    const developersTag = developers.map(
        dev => 
            <tr key={dev.dev_no}>
                <td>{dev.dev_no}</td>
                <td>{dev.dev_name}</td>
                <td>{dev.addr}</td>
                <td>{dev.phone}</td>
            </tr>
    );
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    //----------------------------------------------------------
    // JSX 문법을 가진 return 구문 선언
    // 리턴되는 JSX 문법이 결국 웹화면에 출력된다.
    //----------------------------------------------------------
    return (
        <center>
            <table><tr><td>
            <input type="text" ref={devRef} value={inputText} onChange={textChange} 
                   onKeyPress = {keyPress} /> &nbsp;
            <button onClick={search}>검색</button> &nbsp;
            <button onClick={searchAll}>모두검색</button>
            </td></tr></table>   

            <br/>

            검색 개수 : {developers.length}
            <table border = "1" cellpadding="5">
                <tr>
                    <th>번호</th>
                    <th>직원명</th>
                    <th>주소</th>
                    <th>전화</th>
                </tr>
                {developersTag}
            </table> 
            {developers.length==0?'검색결과가 없습니다.':''}
        </center>
    )
};

export default Search;


/*
자바에서 n행 m열의 데이터를 담는 자료형
List<Map<String, String>> 
    -> 장 : 저장할 객체를 만들 필요가 없다
    -> 단 : 자료형을 String 취급해야 한다.
    -> 화면에 출력용
List<DTO객체>
    -> 장 : 속성변수의 자료형을 DB 자료형과 일치시킬 수 있다. 가독성이 있다.
    -> 단 : DTO 객체를 만들어야 한다.
*/