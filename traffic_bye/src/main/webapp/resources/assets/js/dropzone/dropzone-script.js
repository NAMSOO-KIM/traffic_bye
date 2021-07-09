var DropzoneExample = function () {
    var DropzoneDemos = function () {
        Dropzone.options.repreFileUpload = {
            maxFiles: 10,
            maxFilesize: 10,
            autoProcessQueue: false,
            addRemoveLinks: true,
            dictRemoveFile : "삭제",
            clickable : true,
            paramName: "repreFile",
            headers: {
          		'Cache-Control': null,
          		'X-Requested-With': null,
            },
            url : "addProduct",
            parallelUploads: 10,
            uploadMultiple : true
        };
        Dropzone.options.anotherFileUpload = {
            maxFiles: 10,
            maxFilesize: 10,
            autoProcessQueue: false,
            addRemoveLinks: true,
            dictRemoveFile : "삭제",
            clickable: true,
            paramName: "anotherFile",
            headers: {
          		'Cache-Control': null,
          		'X-Requested-With': null,
            },
            url : "addProduct",
            parallelUploads : 10,
            uploadMultiple : true
        };
        Dropzone.options.fileTypeValidation = {
            paramName: "file",
            maxFiles: 10,
            maxFilesize: 10, 
            acceptedFiles: "image/*",
            accept: function(file, done) {
                if (file.name == "justinbieber.jpg") {
                    done("Naha, you don't.");
                } else {
                    done();
                }
            },
            parallelUploads: 10
        };
    }
    return {
        init: function() {
            DropzoneDemos();
            console.log(Dropzone.getElement('#'))
        }
    };
}();
DropzoneExample.init();