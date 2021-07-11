/**
 * 
 */
 
 $('document').ready(()=>{
	console.log(itemDetailVO);
    let repreFile = Dropzone.forElement('#repreFileUpload');
    let anotherFiles = Dropzone.forElement('#anotherFileUpload');
    $('#stock').val(itemDetailVO.stock);
    $('#price').val(itemDetailVO.price);
    $('#name').val(itemDetailVO.name);
    CKEDITOR.instances.editor1.setData(itemDetailVO.detail);
    $("#bigCategory").val(itemDetailVO.parentCategoryId).prop("selected", true);
    $("#midCategory").val(itemDetailVO.categoryId).prop("selected", true);
    let anotherImages = itemDetailVO.images;
    repreFile.options.thumbnailWidth = 120;
	repreFile.options.thumbnailHeight = 120;
    anotherFiles.options.thumbnailWidth = 120;
	anotherFiles.options.thumbnailHeight = 120;
	let deletedMock = [];
	let rePreFileDeleted = false;
    for(let i = 0; i < anotherImages.length; i++){
		var mockFile = { name : anotherImages[i].realFileName, size: anotherImages[i].fileSize, mock : true};
		console.log(anotherImages[i].originFileURL);
  		anotherFiles.options.addedfile.call(anotherFiles, mockFile);
 		anotherFiles.options.thumbnail.call(anotherFiles, mockFile, anotherImages[i].thumbFileURL);
	}
	let preMock = { name : itemDetailVO.repreFile, size: itemDetailVO.repreFileSize, mock : true}; 
	repreFile.options.addedfile.call(repreFile, preMock);
 	repreFile.options.thumbnail.call(repreFile, preMock, itemDetailVO.thumbFileURL);
    anotherFiles.on("removedfile", function(file){
		if(file.mock){
			console.log(file);
			deletedMock.push(file.name);
			console.log(deletedMock);
		}
	});
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
    $('#updateItem').on('click', function(){
		var detail = CKEDITOR.instances.editor1.getData();
		let formData = new FormData();
		let repre = repreFile.getAcceptedFiles();
		let another = anotherFiles.getAcceptedFiles();
		if(repreFile.length < 1){
			alert("대표 이미지는 필수로 등록해야 합니다!");
			return;
		}	
		let otherData = {
			"name" : $('#name').val(),
			"detail" : detail,
			"bigCategory" : $('#bigCategory').val(),
			"midCategory" : $('#midCategory').val(),
			"stock" : $('#stock').val(),
			"price" : $('#price').val(),
			"deletedImgs" : deletedMock 
		};
		if(!checkIt(otherData)){
			alert("입력되지 않은 정보가 있습니다!");
			return;
		}
		formData.append("items", JSON.stringify(otherData));
		formData.append("repreFile", repre[0]);
		for(let i = 0; i < another.length; i++){
			alert(i);
			formData.append("anotherFile" + i, another[i]);
		}
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
	
	$("#bigCategory").on("change", function(e){
		let bigCategory = e.target.value;
		if(bigCategory == ""){
			$('#midCategory').html("<option value=''>중분류</option>");
		} else{
			$.ajax({
			    data : {"id" : bigCategory},
			    url : "/app/midCategory",
			    type : 'get',
			    success : function(data){
					let midCategory = $('#midCategory');
					let midData = "";
					midCategory.html("");
					for(let i = 0; i < data.length; i++){
						midCategory.append(`<option value=${data[i].id}>${data[i].name}<option>`);
					}
				},
				fail : function(){
					console.log("실패 ㅠ");
				}
			});	
		}
	});
});

function checkIt(d){
	if(d.name == "" || d.detail == "" || d.stock == "" || d.price == "" || d.midCategory == "") return false;
	return true;
}