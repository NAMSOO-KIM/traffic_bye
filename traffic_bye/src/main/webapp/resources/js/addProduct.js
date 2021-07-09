/**
 * 
 */
 
 $('document').ready(()=>{
    let repreFile = Dropzone.forElement('#repreFileUpload');
    let anotherFiles = Dropzone.forElement('#anotherFileUpload');
	repreFile.on("addedfile", function(file){
		if(this.getAcceptedFiles().length > 0){
			alert("대표 이미지는 한개만 등록 가능합니다!");
			this.removeFile(file);
		}
	});
    $('#addProduct').on('click', function(){
		alert("전송 버튼 누름!");
		let productForm = $('#productForm');
		let formData = new FormData(productForm[0]);
		let repre = repreFile.getAcceptedFiles();
		let another = anotherFiles.getAcceptedFiles();
		if(repreFile.length < 1){
			alert("대표 이미지는 필수로 등록해야 합니다!");
			return;
		}	
		formData.append("repreFile", repre[0]);
		alert(another.length);
		for(let i = 0; i < another.length; i++){
			formData.append("anotherFile" + i, another[i]);
			for (var pair of formData.entries()) { console.log(pair[0]+ ', ' + pair[1]); }
			console.log("--------------");
		}
		$.ajax({
			contentType : false,
		    processData : false,
		    data : formData,
		    url : "addProduct",
		    type : 'post',
		    success : function(){
			
			}
		});
		
		//repreFile.processQueue();
	});
});