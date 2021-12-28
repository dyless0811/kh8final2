<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<script src="${root }/resources/ckeditor5/build/ckeditor.js"></script>
<style>


	.imgs_wrap {

        border: 2px solid #A8A8A8;
        margin-top: 30px;
        margin-bottom: 30px;
        padding-top: 10px;
        padding-bottom: 10px;

    }
    .imgs_wrap img {
        max-width: 150px;
        margin-left: 10px;
 	    margin-right: 10px;
    }
	.ck-editor__editable{
		min-height:300px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
        
var sel_files = [];

$(document).ready(function(){
    $("input[name=attach]").on("change", handleImgsFilesSelect);
});

function handleImgsFilesSelect(e) {

    sel_files = [];
    $("#result").empty();

    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);


    var index = 0;
    filesArr.forEach(function(f){
        if(!f.type.match("image.*")){
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_files.push(f);

        var reader = new FileReader();
        reader.onload = function(e) {
            var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
            $("#result").append(html);
            index++;

          }
          
          
          reader.readAsDataURL(f);
          
        });

        
}

function deleteImageAction(index){
  console.log("index : " + index);
  sel_files.splice();
	

	  
  var img_id = "#img_id_" + index;
  var del = $(img_id).remove();



  if(del){
	  $("input[name=attach]").val("");
	  $("#result").empty();
  }

  console.log(sel_files);
}
</script>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<h1>sns 등록 페이지</h1>

<div class="container-600 container-center">
	<div class="row mt-3">
		<form method="post" enctype="multipart/form-data">
			<div class="mt-3">
				<label>작성자 : ${loginNick }</label>
			</div>
			<div class="mt-3">
				<textarea name="snsDetail" id="editor"></textarea>
				<script>
					ClassicEditor
						.create(document.querySelector('#editor'),{
							language: {ui: 'ko', content: 'ko'}
						})
						.catch(error => {
							console.error(error);
						});
				</script>
			</div>
			<div class="mt-4">
				<input type="file" name="attach" accept="image/*" class="form-control" multiple>
			</div>
			
			<div class="imgs_wrap">
				<div id="result"></div>
			</div>
	
			<div class="mt-3">
				<input type="submit" value="등록" class="btn btn-primary">
			</div>
		</form>
	</div>
	

</div>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

	
	