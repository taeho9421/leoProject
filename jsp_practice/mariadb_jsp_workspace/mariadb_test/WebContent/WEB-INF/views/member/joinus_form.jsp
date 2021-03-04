<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="StyleSheet" href="<%=request.getContextPath() %>resources/css/style.css" type="text/css">
<TITLE>** 회원가입 **</TITLE>
<script language="JavaScript">

function MM_openBrWindow(theURL,winName,features) { 
 form = document.join;
 if(winName == "userid_check"){
  if(!checkValue(form.userid, '아이디', 5, 16)){
   return;
  }
  theURL = theURL+"?userid="+form.userid.value;
 }
 window.open(theURL,winName,features);
}

function checkValue(target, cmt, lmin, lmax){
 var Alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
 var Digit = '1234567890';
 var astr = Alpha+Digit;
 var i;
 var tValue = target.value;
 if(tValue.length < lmin || tValue.length > lmax){
  if(lmin==lmax) alert(cmt+'는'+lmin+'Byte이어야 합니다.');
  else alert(cmt+'는'+lmin+'~'+lmax+'Byte 이내로 입력하셔야 합니다.');
  target.focus();
  return false;
 }
 if(astr.length > 1){
  for (i=0; i<tValue.length; i++){
   if(astr.indexOf(tValue.substring(i,i+1))<0){
    alert(cmt+'에 허용할 수 없는 문자가 입력되었습니다.');
    target.focus();
    return false;
   }
  }
 }
 return true;
}



function doSubmit() {
 form = document.join;
 if(!form.userid.value){
  alert('아이디를 입력하지 않았습니다.');
  form.userid.focus();
  return;
 }
 if(!checkValue(form.userid, '아이디', 5, 16)){
  return;
 }
 if(!form.username.value){
  alert('이름을 입력하지 않았습니다.');
  form.username.focus();
  return;
 }
 if(!form.password.value){
  alert('비밀번호를 입력하지 않았습니다.');
  form.password.focus();
  return;
 }
 if(form.password.value != form.password2.value){
  alert('비밀번호가 일치하지 않았습니다.');
  form.password.value = "";
  form.password2.value = "";
  form.password.focus();
  return;
 }
 if(form.userid.value == form.password.value){
  alert("아이디와 비밀번호를 서로 다르게 입력하세요!");
  form.password.value = "";
  form.password2.value = "";
  form.password.focus();
  return;
 }
 if (!checkValue(form.password,'비밀번호',4,12)){
  return;
 }
 
 if(!form.email.value){
  alert('Email을 입력하지 않았습니다.');
  form.email.focus();
  return;
 }
 if(form.email.value.indexOf("@") < 0){
  alert('Email주소 형식이 틀립니다.');
  form.email.focus();
  return;
 }
 if(form.email.value.indexOf(".") < 0){
  alert('Email 도메인 주소가 틀립니다.');
  form.email.focus();
  return;
 }
 if(!form.zipcode1.value || !form.zipcode2.value){
  alert('우편번호를 입력하지 않았습니다.');
  MM_openBrWindow('zipcode_search.jsp', 'zipcode_search', 'scrollbars=yes, width=500, height=250');
  return;
 }
 if(!form.address1.value){
  alert('주소1를 입력하지 않았습니다.');
  MM_openBrWindow('zipcode_search.jsp', 'zipcode_search', 'scrollbars=yes, width=500, height=250');
  return;
 }
 if(!form.address2.value){
  alert('주소2를 입력하지 않았습니다.');
  form.address2.focus();
  return;
 }
 form.submit();
 }

</script>
</HEAD>
<body bgcolor="#FFFFFF" oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
<TABLE align=center cellpadding=8 cellspacing=0 width='650' topmargin="0" leftmargin="0" rightmargin="0" marginheight="0" marginwidth="0" >
<TR>
<TD width="650">
<form name="join" method="post" action="joinus.do">
<table width="650" height="536" border="1" cellspacing="0" cellpadding="0" bordercolor="#A3C2F6">
 <tr> 
  <td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style1">아이디&nbsp;&nbsp;</font></td>
  <td width="75%">&nbsp;
   <input type="text" name="userid" size="16" maxlength="16" class="input_style1">
   <input type="button" value="중복확인" onClick="MM_openBrWindow('userid_check.jsp','userid_check','width=330,height=200')">
   <font class="style2">(영문+숫자 5~16자리) <font color="#0099FF">중복 확인 절차를 거쳐야 합니다.</font></font></td>
 </tr>
 <tr> 
  <td width="15%" align="right" ><font color="#FF0000" size=1>★</font><font class="style1">비밀번호&nbsp;&nbsp;</font></td>
  <td width="75%">&nbsp; 
   <input type="password" name="password" size="12" maxlength="12" class="input_style1">
   <font class="style1">다시한번&nbsp;&nbsp; </font>
   <input type="password" name="password2" size="12" maxlength="12" class="input_style1">
   <font class="style2">(영문+숫자 4~12자리)</font></td>
 </tr>          
 <tr> 
  <td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style1">이름&nbsp;&nbsp;</font></td>
  <td width="75%">&nbsp;<input type="text" name="username" size="10" maxlength="10" class="input_style1"> </td>
 </tr>

 <tr > 
  <td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style1">EMAIL&nbsp;&nbsp;</font></td>
  <td width="75%">&nbsp;<input type="text" name="email" size="20" maxlength="50" class="input_style1"></td>
 </tr>
 <tr > 
  <td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style1">우편번호&nbsp;&nbsp;</font></td>
  <td width="75%">&nbsp; 
   <input type="text" name="zipcode1" size="3" maxlength="3" class="input_style1" > - 
   <input type="text" name="zipcode2" size="3" maxlength="3" class="input_style1" >
   <input name="button" type="button" onClick="MM_openBrWindow('zipcode_search.jsp','zipcodesearch','scrollbars=yes,width=500,height=250')" value="우편번호 검색">
   <font class="style2"><font color="#0099FF">우편번호 검색 버튼을 누르세요.</font></font></td>
 </tr>
 <tr> 
  <td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style1">주소&nbsp;&nbsp;</font></td>
  <td width="75%">&nbsp;<input type="text" name="address1" size="50" maxlength="100" class="input_style1" ></td>
 </tr>
 <tr> 
  <td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style1">나머지 주소&nbsp;&nbsp;</font></td>
  <td width="75%">&nbsp;
   <input type="text" name="address2" size="50" maxlength="100" class="input_style1">
   <font class="style2"><font color="#0099FF">나머지 주소를 적어 넣습니다.</font></font></td>
 </tr>
 <tr > 
  <td width="15%" align="right"><font class="style1">핸드폰&nbsp;&nbsp;</font></td>
  <td width="75%">&nbsp; 
   <select name="phone1">
    <option value="010">010</option>                
    <option value="011">011</option>
    <option value="016">016</option>
    <option value="017">017</option>
    <option value="018">018</option>
    <option value="019">019</option>
   </select> - 
   <input type="text" name="phone2" size="4" maxlength="4" class="input_style1">  - 
   <input type="text" name="phone3" size="4" maxlength="4" class="input_style1"></td>
 </tr>
</table>
<br>
<table width="614" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr>
  <td width=100% align="center"> 
   <input type="hidden" name="userid_check">
   <input type="button" value="등   록"  onClick="doSubmit()">&nbsp;
   <input type="reset" value="다시쓰기" >&nbsp;
   <input type="button" value="취   소"  onClick="javascript:history.go(-1);">
  </td>
 </tr>
</table>
</form>
</TD></TR></TABLE>
<div align="center">

<table width="638" border="0" cellpadding="0" cellspacing="0">
 <tr> 
  <td bgcolor="#FFFFFF" width="638" nowrap><p align="center"><br>Copyright by JSP Study</p></td>
 </tr>
</table>
</div>
<p>&nbsp;</p>
</body>
</html>