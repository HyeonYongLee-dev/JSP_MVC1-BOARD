<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<%@ page language="java"   contentType="text/html; charset=UTF-8"
     import="java.util.*,sec01.ex01.*" 
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="m" class="sec01.ex01.MemberBean" scope="page"/>
<jsp:setProperty name="m" property="*"/>

<%	/*
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	
	MemberBean m=new MemberBean(id,pwd,name,email);
	m.setId(id);
	m.setPwd(pwd);
	m.setName(name);
	m.setEmail(email);
	*/
	
	MemberDAO memberDAO=new MemberDAO();
	memberDAO.addMember(m);
	List memberList=memberDAO.listMembers();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록창</title>

</head>
<body>
<table align="center" width="100%">
	<tr align="center" bgcolor="green">
		<td width="7%">아이디</td>
		<td width="7%">비밀번호</td>
		<td width="7%">이름</td>
		<td width="7%">이메일</td>
		<td width="7%">가입일</td>
	</tr>
	
	<%
		if(memberList.size()==0) {
	%>	
		<tr>
			<td colspan="5">
				<p align="center"><b><span style="font-size:9pt;">
					등록된 회원이 없다</span></b></p>
			</td>
		</tr>
	<%
		}else {
			for(int i=0; i<memberList.size(); i++) {
					MemberBean bean=(MemberBean)memberList.get(i);

	%>	
	
		<tr align="center">
			<td>
				<jsp:getProperty property="m" name="id"/>
			</td>
			<td>
				<jsp:getProperty property="m" name="pwd"/>
			</td>
			<td>
				<jsp:getProperty property="m" name="name"/>
			</td>
			<td>
				<jsp:getProperty property="m" name="email"/>
			</td>
		</tr>
	<%
			} //end for
		} //end if
	%>							
		<tr height="1" bgcolor="green">
			<td colspan="5"/>
		</tr>
</table>
</body>
</html>