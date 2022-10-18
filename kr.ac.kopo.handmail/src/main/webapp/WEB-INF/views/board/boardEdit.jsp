<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/include.css" type="text/css"/>

<!-- BBS Style -->
<link href="/resources/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="/resources/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://cdn.tiny.cloud/1/2xpj4d22abg4qy6hhumahoojfub87knrquwrq4mbmjj9saoo/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
<script>
$(function(){
    var plugins = [
        "advlist", "autolink", "lists", "link", "image", "charmap", "print", "preview", "anchor",
        "searchreplace", "visualblocks", "code", "fullscreen", "insertdatetime", "media", "table",
        "paste", "code", "help", "wordcount", "save"
    ];
    var edit_toolbar = 'formatselect fontselect fontsizeselect |'
               + ' forecolor backcolor |'
               + ' bold italic underline strikethrough |'
               + ' alignjustify alignleft aligncenter alignright |'
               + ' bullist numlist |'
               + ' table tabledelete |'
               + ' link image';

    tinymce.init({
    	language: "ko_KR", //한글판으로 변경
        selector: '#boardContent',
        <c:if test="${member == null}">
        	readonly: true,
    	</c:if>
        height: 567,
        menubar: false,
        plugins: plugins,
        toolbar: edit_toolbar,
        
        /*** image upload ***/
        image_title: true,
        /* enable automatic uploads of images represented by blob or data URIs*/
        automatic_uploads: true,
        /*
            URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
            images_upload_url: 'postAcceptor.php',
            here we add custom filepicker only to Image dialog
        */
        file_picker_types: 'image',
        /* and here's our custom image picker*/
        file_picker_callback: function (cb, value, meta) {
            var input = document.createElement('input');
            input.setAttribute('type', 'file');
            input.setAttribute('accept', 'image/*');

            /*
            Note: In modern browsers input[type="file"] is functional without
            even adding it to the DOM, but that might not be the case in some older
            or quirky browsers like IE, so you might want to add it to the DOM
            just in case, and visually hide it. And do not forget do remove it
            once you do not need it anymore.
            */
            input.onchange = function () {
                var file = this.files[0];

                var reader = new FileReader();
                reader.onload = function () {
                    /*
                    Note: Now we need to register the blob in TinyMCEs image blob
                    registry. In the next release this part hopefully won't be
                    necessary, as we are looking to handle it internally.
                    */
                    var id = 'blobid' + (new Date()).getTime();
                    var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
                    var base64 = reader.result.split(',')[1];
                    var blobInfo = blobCache.create(id, file, base64);
                    blobCache.add(blobInfo);

                    /* call the callback and populate the Title field with the file name */
                    cb(blobInfo.blobUri(), { title: file.name });
                };
                reader.readAsDataURL(file);
            };
            input.click();
        },
        /*** image upload ***/
        
        content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
    });
});

$(document).ready(function(){
	//삭제
	$("#btnDel").click(function() {
		if (!confirm("삭제하시겠습니까?")) {
			return false;
		}
	});
	
	//수정
	$("#btnUpt").click(function() {
		if (!confirm("수정하시겠습니까?")) {
			return false;
		}
	});
});
</script>
<style type="text/css">
th {
	width: 100px;
	background-color: white;
}

#box {
	width: 1200px;
	margin: 0 auto;
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<%-- <div class="board_view">				
				<dl class="tit_view">
					<dt>제목</dt>
					<dd><c:out value="${boardVO.boardTitle}"/></dd>
				</dl>
				<dl class="info_view2">
					<dt>작성자ID</dt>
					<dd><c:out value="${boardVO.boardWriter}"/></dd>
					<dt>작성일</dt>
			<dd><fmt:formatDate value="${boardVO.boardRegDate}" pattern="yyyy-MM-dd"/></dd>
					<dt>조회수</dt>
					<dd><c:out value="${boardVO.inqireCo}" /></dd>
				</dl>
				<div class="view_cont">
					<c:out value="${result.boardContent}" escapeXml="false" />
				</div>
			</div>
	 --%>
<form action='${pageContext.request.contextPath}/board/edit.do' method='post'>
	<input type="hidden" name="boardNo" value="${boardVO.boardNo}"/>
	<table class="table" id="box">
		<tbody>
		<c:if test="${member == null}">
			<tr>
				<th>작성자</th>
				<td><c:out value="${boardVO.boardWriter}"/></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${boardVO.boardRegDate}" pattern="yyyy/MM/dd"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type='text' name='boardTitle' value="${boardVO.boardTitle}" class="form-control" readonly="readonly"/></td>			
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="boardContent"  rows="10" cols="30" name="boardContent" class="form-control" readonly>${boardVO.boardContent}</textarea></td>			
			</tr>
		</c:if>
		<c:if test="${member != null}">
			<tr>
				<th>작성자</th>
				<td><c:out value="${boardVO.boardWriter}"/></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${boardVO.boardRegDate}" pattern="yyyy/MM/dd"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type='text' name='boardTitle' value="${boardVO.boardTitle}" class="form-control"/></td>			
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="boardContent"  rows="10" cols="30" name="boardContent" class="form-control">${boardVO.boardContent}</textarea></td>			
			</tr>
		</c:if>
		</tbody>
	</table>
	<div class="btn-cont ar">
		<c:if test="${member != null}">
			<input type="submit" value="수정" class="btn btn-outline-primary" id="btnUpt">
		</c:if>	
		<a href='${pageContext.request.contextPath}/board/list.do'><input type="button" value="목록" class="btn btn-outline-primary"></a>
		<c:if test="${member != null}">	
			<a href='${pageContext.request.contextPath}/board/del.do?boardNo=${boardVO.boardNo}'><input type="button" value="삭제"  id="btnDel" class="btn btn-outline-danger"></a>
		</c:if>
	</div>
</form>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
</body>
</html>