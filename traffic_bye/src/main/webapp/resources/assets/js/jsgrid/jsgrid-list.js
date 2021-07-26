(function($) {
    "use strict";
    $("#basicScenario").jsGrid({
		editButton: true,
        width: "100%",
        filtering: true,
        sorting: true,
        paging: true,
        autoload: true,
        pActionSize: 15,
        pActionButtonCount: 5,
        deleteConfirm: "정말 삭제하시겠습니까?",
        controller: db,
        fields: [
            { name: "상품번호", type: "number", width: 30},
            {
                name: "이미지",
                itemTemplate: function(val, item) {
                    return $("<img>").attr("src", val).css({ height: 50, width: 50 }).on("click", function() {
                        $("#imagePreview").attr("src", item.Img);
                        $("#dialog").dialog("open");
                    });
                },
                insertTemplate: function() {
                    var insertControl = this.insertControl = $("<input>").prop("type", "file");
                    return insertControl;
                },
                insertValue: function() {
                    return this.insertControl[0].files[0];
                },
                align: "center",
                width: 50
            },
            { name: "상품명", type: "text", width: 100},
            { name: "카테고리", type: "text", width: 50},
            { name: "재고", type: "number", width: 50},
        { type: "control" }
        ]
    });
})(jQuery);
