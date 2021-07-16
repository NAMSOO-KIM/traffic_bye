<?php

// 루트 경로 탐색 or 경로를 직접 입력 가능 ex. "C:/nginx/data"
$dir = getcwd();
// 경로 내의 모든 파일 찾기
$files = scandir($dir);

$file_list = array();
$folder_list = array();

foreach($files as $key => $value){
    

    if(is_dir($dir.'/'.$value)){
        $tmp = array('file_name' => $value, 'file_type' => 'dir');
        array_push($folder_list, $tmp);
    }
    else{
        $tmp = array('file_name' => $value, 'file_type' => 'file');
        array_push($file_list, $tmp);
    }
}

    header('Content-type: application/json');
    echo json_encode(array_merge($folder_list, $file_list));
?>