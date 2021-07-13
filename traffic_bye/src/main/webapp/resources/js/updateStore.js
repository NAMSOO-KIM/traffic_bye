/**
 * 
 */
 
 $('document').ready(()=>{
	let currPath = location.pathname; 
    let repreFile = Dropzone.forElement('#repreFileUpload');
    CKEDITOR.instances.editor1.setData(storeDetailVO.detail);
    $('#streamingURL').val(storeDetailVO.streamingURL);
    $('#name').val(storeDetailVO.name);
    $('#capacity').val(storeDetailVO.capacity);
    $('#location').val(storeDetailVO.location);
    $('#contact').val(storeDetailVO.contact);
    repreFile.options.thumbnailWidth = 120;
	repreFile.options.thumbnailHeight = 120;
	let rePreFileDeleted = false;
	let preMock = { name : storeDetailVO.repreFile, size: storeDetailVO.repreFileSize, mock : true}; 
	repreFile.options.addedfile.call(repreFile, preMock);
 	repreFile.options.thumbnail.call(repreFile, preMock, storeDetailVO.thumbFileURL);
	repreFile.on("removedfile", function(file){
		if(file.mock){
			repreFileDeleted = true;
		}
	});
	repreFile.on("addedfile", function(file){
		if(this.getAcceptedFiles().length > 0){
			alert("대표 이미지는 한개만 등록 가능합니다!");
			this.removeFile(file);
		}
	});
    $('#updateStore').on('click', function(){
		var detail = CKEDITOR.instances.editor1.getData();
		let formData = new FormData();
		let repre = repreFile.getAcceptedFiles();
		if(repreFile.length < 1){
			alert("대표 이미지는 필수로 등록해야 합니다!");
			return;
		}	
		let otherData = {
			"name" : $('#name').val(),
			"detail" : detail,
			"streamingURL" : $('#streamingURL').val(),
			"capacity" : $('#capacity').val(),
			"location" : $('#location').val(),
			"contact" : $('#contact').val() 
		};
		if(!checkIt(otherData)){
			alert("입력되지 않은 정보가 있습니다!");
			return;
		}
		formData.append("items", JSON.stringify(otherData));
		formData.append("repreFile", repre[0]);
		console.log(otherData);
		$.ajax({
			enctype : 'multipart/form-data',
			contentType : false,
		    processData : false,
		    data : formData,
		    url : "",
		    type : 'post',
		    success : function(data){
				location.href = "/app/store/1/item/" + data;
			},
			fail : function(){
				console.log("실패 ㅠ");
			}
		});
	});
	

});

function checkIt(d){
	if(d.name == "" 
		|| d.detail == "" || 
		d.streamingURL == "" || 
		d.capacity == "" || 
		d.location == "" || 
		d.contact == "") return false;
	return true;
}