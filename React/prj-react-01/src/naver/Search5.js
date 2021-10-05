//=======================================================================
// 프로젝트명 /node_modules/react 안에 default 가 붙어 수출하는 
//      컴포넌트를 수입해서 현재 파일 안에서 React 란 이름으로 사용
// 프로젝트명 /node_modules/react 안에 default 가 안 붙어 수출하는 
//      useState 컴포넌트를 수입해서 현재 파일 안에서 useState 란 이름으로 사용
//----------------------------------------------------------
// <참고> 아래 수입 코드는 함수 컴포넌트가 선언되는 js 파일 안에서는 필수로 수입되는 컴포넌트들이다.
//=======================================================================
import React, {useState, useRef, useEffect} from 'react';

// 
const developerList = [
    {dev_no : 1, dev_name: '사오정'  , addr: '서울', phone:'010-1234-1234'}
    ,{dev_no: 2, dev_name: '저팔계'  , addr: '부산', phone:'010-1111-1234'}
    ,{dev_no: 3, dev_name: '손오공'  , addr: '대구', phone:'010-3333-1234'}
    ,{dev_no: 4, dev_name: '삼장법사', addr: '울산', phone:'010-4444-1234'}
    ,{dev_no: 5, dev_name: '오공이'  , addr: '광주', phone:'010-5555-1234'}
    ,{dev_no: 6, dev_name: '나무늘보', addr: '서울', phone:'010-6666-1234'}
    ,{dev_no: 7, dev_name: '비바비바', addr: '서울', phone:'010-7777-1234'}
    ,{dev_no: 8, dev_name: '비바비바', addr: '경기', phone:'010-7777-1234'}
    ,{dev_no: 9, dev_name: '비바비바', addr: '인천', phone:'010-7777-1234'}
];

//=======================================================================
// 리액트의 단위 프로그램 중 하나인 [함수 컴포넌트] 선언하기
//=======================================================================
const Search5 = () => {

    //----------------------------------------------------------
    // 재 마운트(=함수 컴포넌트 내용 재 호출)되게 하는 지역변수들을 선언하기
    // 검색 결과물 저장 변수 developers 선언
    // 키워드 저장 변수 keyword 선언
    // 체크된 주소 저장 변수 addrs 선언
    const [developers, setDevelopers] = useState( developerList );
    const [keyword, setKeyword] = useState( "" );
    const [addrs, setAddrs] = useState( [] );
    //----------------------------------------------------------
    
    //----------------------------------------------------------
    // 키워드 입력 양식을 관리할 객체를 저장할 변수 선언
    const keywordRef = useRef(null);
    //----------------------------------------------------------
    
    //----------------------------------------------------------
    // 마운트 될 때마다(처음 마운트 후 또는 developers/keyword/addrs 변수 변경 시 마운트 후)
    // 키워드에 포커스 넣기
    useEffect (
        () => {
            keywordRef.current.focus();
        }
    );
    //----------------------------------------------------------
    
    //----------------------------------------------------------
    // addrs 변수 안의 데이터 변경 시 일어나는 마운트(=함수안의 모든 코딩이 실행된 이후) 후에만 
    // search(); 구문 실행하도록 설정하기
    // useEffect( ()=> { 마운트 후에 실행할 코딩 }, [useState 함수 호출로 저장한 변수명] ) 
    useEffect(
        () => {
            search();
        }, [addrs]
    );
    //----------------------------------------------------------

    //----------------------------------------------------------
    // 키워드 내용 변경 시 즉, 키워드 입력란에 데이터가 입력될 때 실행할 구문 설정
    const keywordChange = e => {
        setKeyword(
            e.target.value  // 이벤트가 발생한 입력양식의 value 값
        );
    }
    //----------------------------------------------------------
    
    //----------------------------------------------------------
    // 주소에 체크 넣기/빼기 시 실행할 구문 설정
    const addrChecked = e => {
        // 체크의 넣기/빼기 이벤트가 발생한 입력 양식의 value 값 얻기
        const val = e.target.value;

        // 체크의 넣기 또는 빼기 정보 얻기
        const checked = e.target.checked;

        // 만약에 체크가 되어 있으면 addrs 변수 안의 Array 객체 안에 누적하기
        if( checked ){
            setAddrs(addrs.concat(val));
        }
        // 만약에 체크가 되어 있지 않으면 addrs 변수 안의 Array 객체에서 
        // 체크 안된 value 값을 삭제하기 
        else {
            setAddrs(addrs.filter(addr => addr != val));
        }
    }
    //----------------------------------------------------------
    
    //----------------------------------------------------------
    // 검색 버튼 클릭 시 실행할 구문 설정
    const search = () =>{
        // 지역변수 flag1 선언, 키워드가 비어 있거나 공백으로만 구성되어 있으면 false를 flag1에 저장하기 
        const flag1 = keyword !== null && keyword !== undefined && keyword.split(" ").join("") !== "";
        
        // 지역변수 flag2 선언, addrs 변수 안의 Array 객체가 null 이 아니고 배열변수의 개수가 0보다 크면
        // 즉, 체크된 대상의 value 값이 들어 있으면 true를 flag2에 저장하기
        const flag2 = addrs != null && addrs.length > 0;
        
        // 키워드도 없고 주소도 무체크 되어 있으면 함수 중단하기
        if( !(flag1 || flag2) ){
            setDevelopers(developerList);
            return;
        } 

        let tmp_keyword = "";
        if(flag1) { tmp_keyword = keyword.trim() };

        // 키워드 또는 체크된 주소를 가지고 있는 행만 모아 새로운 Array 객체 얻기
        const new_developerList = developerList.filter(
            developer => {
                let flag3 = false;
                let flag4 = false;

                if(flag1) {
                    flag3 = developer.dev_name.indexOf(tmp_keyword) >= 0
                            || developer.addr.indexOf(tmp_keyword) >= 0
                            || developer.phone.indexOf(tmp_keyword) >= 0;
                }
                if(flag2){
                    flag4 = addrs.includes("서울") && developer.addr === "서울"
                            || addrs.includes("경기") && developer.addr === "경기"
                            || addrs.includes("인천") && developer.addr === "인천"
                            || (
                                addrs.includes("기타")
                                && developer.addr !== "서울"
                                && developer.addr !== "경기"
                                && developer.addr !== "인천"
                            );
                }

                let result = false; 
                
                if(flag1 && flag2 ){result = flag3 && flag4;}
                else if(flag1 && !flag2 ){result = flag3;}
                else if(!flag1 && flag2){result = flag4;}

                return result;
            }
            
        );

        // 키워드 또는 체크된 주소를 가지고 있는 행만 모인 새로운 Array 객체를 developers에 새롭게 갱신 저장하기
        setDevelopers(new_developerList);

        keywordRef.current.focus();
    }
    //----------------------------------------------------------
    
    //----------------------------------------------------------
    // 모두 검색 버튼 클릭 시 실행할 구문 설정
    const searchAll = () => {
        // keyword 변수 비우기
        // addrs 변수에 [] 넣기
        // developers 변수에 developerList 변수 안의 데이터 넣기
        setKeyword("");
        setAddrs([]);
        setDevelopers(developerList);
    }
    //----------------------------------------------------------
    
    //----------------------------------------------------------
    // 지역변수 searchResultTag 선언. 검색 결과물이 저장된 developers 안의 데이터를 html 태그와 섞어서 누적하기
    const searchResultTag = developers.map(
        developer =>
        <tr>
            <td>{developer.dev_no}</td>
            <td>{developer.dev_name}</td>
            <td>{developer.addr}</td>
            <td>{developer.phone}</td>
        </tr>
    );
    //----------------------------------------------------------

    //----------------------------------------------------------
    return(
        <>
        <center>
            {/* 검색 조건 출력하는 HTML 선언하기 */}
            <table cellpadding = "5" borderColor="lightgray">
                <caption>[검색 조건]</caption>
                <tr>
                    <td align="right">키워드</td>
                    <td>
                        <input type="text" value={keyword} onChange={keywordChange} ref={keywordRef} />
                    </td>
                </tr>
                <tr>
                    <td align="right">주소</td>
                    <td>
                        <input type="checkbox" name="addr" value="서울" checked={addrs.includes("서울")} onChange={addrChecked}/>서울
                        <input type="checkbox" name="addr" value="경기" checked={addrs.includes("경기")} onChange={addrChecked}/>경기
                        <input type="checkbox" name="addr" value="인천" checked={addrs.includes("인천")} onChange={addrChecked}/>인천
                        <input type="checkbox" name="addr" value="기타" checked={addrs.includes("기타")} onChange={addrChecked}/>기타
                    </td>
                </tr>

            </table>
            <br/>

            {/* 검색 버튼, 모두 검색 버튼 출력하는 HTML 선언하기 */}
            <button onClick={search}>검색</button> &nbsp;
            <button onClick={searchAll}>모두검색</button>

            <br/><br/>
            검색 개수 : {developers.length}
            <table cellpadding="5" border="1">
                <tr bgColor="lightgray">
                    <th>번호</th>
                    <th>직원명</th>
                    <th>주소</th>
                    <th>전화</th>
                </tr>
                {searchResultTag}
            </table>
        </center>
        </>
    );

}

export default Search5;

