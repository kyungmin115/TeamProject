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
        height: 500,
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

</script>
</head>

<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<form action='${pageContext.request.contextPath}/board/edit.do' method='post'>
	
			<input type="hidden" name="boardNo" value="${boardVO.boardNo}"/>
<table class="table">
	<tbody>
		<tr>
			<td>제목</td>
			<td><input type='text' name='boardTitle' value="${boardVO.boardTitle}" class="form-control"/></td>			
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea id = "boardContent"  rows="10" cols="30" name="boardContent" class="form-control">${boardVO.boardContent}</textarea></td>			
		</tr>
		<tr>
			<td>작성자</td>
			<td><c:out value="${boardVO.boardWriter}"/></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><fmt:formatDate value="${boardVO.boardRegDate}" pattern="yyyy/MM/dd"/></td>
		</tr>

	</tbody>
</table>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
<a href='${pageContext.request.contextPath}/board/list.do'><input type="button" value="목록" class="btn btn-outline-primary"></a>

<input type="submit" value="수정" class="btn btn-outline-primary" >
</div>
</form>

	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	

</body>

</html>