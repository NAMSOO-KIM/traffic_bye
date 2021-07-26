/**
 * 
 */
$('document').ready(()=>{
	$('.updateItem').on('click', function(){
		let currPath = location.pathname;
		let lastIndex = currPath.lastIndexOf("/");
		let itemId = $(this).parent().parent().children('td').html(); 
		let newPath = currPath.substr(0, lastIndex) + "/updateItem/" + itemId;
		location.href = newPath;
	});
	$('.deleteItem').on('click', function(){
		let check = confirm("정말 삭제하시겠습니까?");
		if(check){
			let currPath = location.pathname;
			let lastIndex = currPath.lastIndexOf("/");
			let itemId = $(this).parent().parent().children('td').html(); 
			let newPath = currPath.substr(0, lastIndex) + "/items/" + itemId;
			$.ajax({
			     url: newPath,
        		 method: "DELETE",
		         statusCode: {
					400:function(data) {
						alert("삭제하는데 실패했습니다!");
				 	}
				 }
      		}).done(function (data, textStatus, xhr) {
				location.reload();
      		}).fail(function (data, textStatus, xhr){
	
      		});
		}
	});
});