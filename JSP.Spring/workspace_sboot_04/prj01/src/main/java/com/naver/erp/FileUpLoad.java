package com.naver.erp;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileUpLoad {

//---------------------------------------------------------------------
	private MultipartFile multi;
	// 업로드한 파일의 새 파일명 저장할 변수 선언하기. 파일명에는 확장자가 포함된다.
	private String newFileName;
//---------------------------------------------------------------------
	public FileUpLoad(MultipartFile multi) {
		this.multi = multi;
		
		// 객체 생성하면서 파일명 생성하기 (함수로 분리할 경우 함수 호출할 때마다 새로운 파일명이 생성되므로)
		// 만약, 업로드된 파일이 있으면
		if( multi!=null && !multi.isEmpty()) {
			// 업로드된 파일의 원래 파일명 얻기. 파일명에는 확장자가 포함된다.
			// 업로드한 파일의 파일확장자 얻기
			String oriFileName = multi.getOriginalFilename();
			String file_extension = oriFileName.substring( oriFileName.lastIndexOf(".")+1 );
			
			// 고유한 새 파일명 얻기. 파일명에는 확장자가 포함된다.
			this.newFileName = UUID.randomUUID() + "." + file_extension;  // UUID.randomUUID(): 고유한(중복되지 않는) 새 이름
		}
		
	}
//---------------------------------------------------------------------
	public String getNewFileName() {
		return this.newFileName;
	}
//---------------------------------------------------------------------
	public String getNewFileName(boolean flag) {
		return flag? this.newFileName : null;
	}
//---------------------------------------------------------------------
	public void upLoadFile(String upLoadDir) throws Exception {
		
		// 만약 업로드된 파일이 있으면
		if( multi!=null && !multi.isEmpty() && newFileName != null && newFileName.length() > 0 ) {
			// 새 파일을 생성하기. File 객체를 생성하면 새 파일을 생성할 수 있다.
			File file = new File( upLoadDir + this.newFileName );  // 파일 경로를 포함한 생성파일명
			
			// 업로드한 파일을 새 파일에 전송하여 덮어쓰기
			multi.transferTo(file);
		}
		
	}
//---------------------------------------------------------------------
	public void delete(String filePath) {
		
		File file = new File(filePath);
		file.delete();
		
	}
//---------------------------------------------------------------------
	public void delete(String filePath, boolean flag) {
		if(flag) {
			delete(filePath);
		}
	}
//---------------------------------------------------------------------
	
	
}



/*
	
	FileUpLoad fileUpLoad = new FileUpLoad(multi);
	
	board.setPic( fileUpLoad.getNewFileName() );
	
	DB 연동 코드
	
	fileUpLoad.upLoadFile(upLoadDir);
	
*/