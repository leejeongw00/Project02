<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 축구</title>
</head>
<body>
<h2>건의사항</h2>

<table border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup> 
    <tr>
        <td>번호</td> <td>${dto.idx }</td>
        <td>작성자</td> <td>${dto.name }</td>
    </tr>
    <tr>
        <td>작성일</td> <td>${dto.postdate }</td>
        <td>조회수</td> <td>${dto.visitcount }</td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${dto.title }</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3" height="100">${dto.content } </td>
    </tr> 
    <tr>
        <td>첨부파일 </td>
        <td>            
        <!-- 
        첨부된 파일이 있는 경우에는 파일명과 다운로드 링크를 출력한다.
        다운로드가 완료되면 카운트 하기 위해 idx(일련번호)를 파라미터로 받는다.
         -->
            <c:if test="${not empty dto.ofile }">
            ${dto.ofile }
            <a href="../Home/download.do?ofile=${dto.ofile }&sfile=${dto.sfile }&idx=${dto.idx }">[다운로드]</a>
            </c:if>            
        </td>
         <td>다운로드수</td>
        <td>${dto.downcount }</td>
    </tr> 
    <tr>
        <td colspan="4" align="center">
            <button type="button" onclick="location.href='../Home/pass.do?mode=edit&idx=${param.idx }';">수정하기
            </button>
            <button type="button" onclick="location.href='../Home/pass.do?mode=delete&idx=${param.idx }';">삭제하기
            </button>
            <button type="button" onclick="location.href='../Home/list.do';">목록 바로가기
            </button>
        </td>
    </tr>
</table>
<jsp:include page="/layout/footer.jsp" />
</body>
</html>
