
/*
form 객체에 하위 요소는 form객체.name명 으로 가져올 수 있다.

form 하위의 DOM객체 얻기
1) document.forms 이용(HTMLCollection얻는다.)
2) form이름이 바로 form 객체가 된다.
    예) form객체.form하위속성name명
3) id지정시 getElementById쓰기  tag로 얻거나 querySelector 사용도 가능...




form객체.submit()사용으로 submit이 가능하다. 다만 submit이벤트는 발생하지 않는다.
*/
// var a = document.getElementsByTagName('form');
// consol.log(a);
// document.getElementsByTagName('input')[0].addEventListener('keypress',function(){
//     document.getElementById('idError').innerHTML = '';
// });


//문제  -- 
window.onload = function(){
    var input = document.getElementsByName('id')[0];
    input.addEventListener('keyup',function(){
        
        document.getElementById('idError').innerHTML = input.value;
        if(input.value == ''){
            document.getElementById('idError').innerHTML = '아이디를 입력하세요.';
        }
    });
};

// input.addEventListener('keypress',function(){
//     document.getElementById('idError').innerHTML = '';
// });


function isValidate(obj){
    
    if(obj.id.value == ''){
        //alert('아이디를 입력하세요');
        //문제) alert()대신 빨간 문구 입력하기.
        //input상자의 상위에 div하고 span넣어서 하기...
        document.getElementById('idError').innerHTML = '아이디를 입력하세요.';
        obj.id.focus();
        return false;
        
    }

    
    if(frmObj.pwd.value.length == 0){
        alert('비밀번호를 입력하세요');
        frmObj.pwd.focus();
        return false;
    }
    if(frmObj.pwd2.value == ''){
        alert('비밀번호 확인을 입력하세요');
        frmObj.pwd2.focus();
        return false;
    }
    if(frmObj.pwd.value != frmObj.pwd2.value){
        alert('비밀번호 일치하지 않습니다.');
        frmObj.pwd2.value = '';
        frmObj.pwd2.focus();
        return false;
    }
    //라디오 버튼 선택여부 판단
    var isGender = false;
    //일반 for문 적용
    /*
    for(var i=0;i<obj.gender.length;i++){
        if(obj.gender[i].checked){
            isGender = true;
            break;
        }
    }
    */
    obj.gender.forEach(function(radio){
        if(radio.checked){
            isGender = true;
        }    
    });

    if(!isGender){
        alert('성별을 선택하세요.');
        return false;
    }
    /*
    문제) checkbox 3개 이상 선택하도록 하게 만들기
    */
    /*
    var count=0;
    obj.inter.forEach(function(checkbox){
        if(checkbox.checked){
            count++;
        }
    });
    if(count<3){
        alert('3개이상 관심사항을 체크하세요.');
        return false;
    }
    */
    var count = 0;
    var notChecked = [];
    
    for(var i=0;i<obj.inter.length;i++){
        if(obj.inter[i].checked){
            count++;
        }
        else{
            notChecked.push(i);
        }
    }
    if(count<3){
        alert('3개이상 관심사항을 체크하세요.');
        obj.inter[notChecked[0]].focus();
        return false;
    }
    //학력선택..
    if(obj.grade.value == ''){
        alert('학력을 선택하세요.');
        obj.grade.focus();
        return false;
    }


    if(obj.file.value == ''){
        alert('파일을 첨부하세요.');
        obj.file.focus();
        return false;

    }

    if(obj.self.value == ''){
        alert('입력하세요');
        obj.self.focus();
        return false;
    }

    return true;
    //자스에서 함수가 반환값이 없을때 undefined반환
}


function fnNoSubmitButton(obj){
    //form객체의 submit()함수로 전송
    // form이 아닌 input에 type ='button'
    console.log(obj);
    if(obj == undefined){ // obj가 form이 아닌경우
        obj = document.forms[0];
    }
    if(isValidate(obj)) obj.submit();
}

