<%@page import="org.comstudy21.myweb.model.MemberTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>

	<h3>회원 목록</h3>
	<table class="table table-hover">
		<tr>
			<th>성명</th>
			<th>키</th>
			<th>몸무게</th>
			<th>나이</th>
			<th>성별</th>
		</tr>
	<%
	if(request.getAttribute("list") != null) {
		ArrayList<MemberTO> list = (ArrayList<MemberTO>)request.getAttribute("list");
		for(int i=0; i<list.size(); i++) {
			MemberTO member = list.get(i);
	%>
		<tr>
			<td><%=member.getName() %></td>
			<td><%=member.getHeight() %></td>
			<td><%=member.getWeight() %></td>
			<td><%=member.getAge() %></td>
			<td><%=member.getGender() %></td>
		</tr>
	<%
		} // end of for
	} // end of if
	%>
	</table>

<%@ include file="/inc/footer.jsp"%>