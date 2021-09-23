package com.sohee.erp;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

//---------------------------------------------------------------------
// 파일 업로드 관련 메소드를 제공하는 FileUpLoad 클래스 선언
//---------------------------------------------------------------------
public class FileUpLoad {

	//---------------------------------------------------------------------
	// 업로드되는 파일을 관리하는 MultipartFile 객체의 메위주를 저장하는 속성변수 선언
	// 업로드되는 파일의 새 파일명 저장할 변수 선언하기. 파일명에는 확장자가 포함된다.
	//---------------------------------------------------------------------
	private MultipartFile multi;
	private String newFileName;
	//---------------------------------------------------------------------
	// 생성자(Constructor) 선언
	// <참고> 생성자는 객체 생성 시 단, 한 번 호출된다. 이 때, 외부에서 데이터가 주입된다.
	//---------------------------------------------------------------------
	public FileUpLoad(MultipartFile multi) {
		// 매개변수로 들어온 MultipartFile 객체를 속성변수 multi에 저장하기
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
	// 속성변수 newFileName 안의 데이터를 리턴하는 메소드 선언
	// 새로운 파일명을 리턴하는 메소드 선언
	//---------------------------------------------------------------------
	public String getNewFileName() {
		return this.newFileName;
	}
	//---------------------------------------------------------------------
	// 속성변수 newFileName 안의 데이터를 리턴하는 메소드 선언 (method overloading)
	// 매개변수로 boolean 값이 들어온다.
	// 새로운 파일명을 리턴하는 메소드 선언
	//---------------------------------------------------------------------
	public String getNewFileName(boolean flag) {
		// 만약 매개변수로 들어온 데이터가 true 면 속성변수 newFileName 안의 데이터를 리턴
		// 아니면 null 리턴하기
		return flag? this.newFileName : null;
	}
	//---------------------------------------------------------------------
	// 업로드된 파일을 원하는 폴더에 새로운 이름으로 실제 저장하는 메소드 선언
	//---------------------------------------------------------------------
	public void upLoadFile(String upLoadDir) throws Exception {
		
		// 매개변수로 들어온 저장경로 맨 뒤에 \ 가 없으면 넣어주기
		if(!upLoadDir.endsWith("\\")) {
			upLoadDir += "\\";
		}
		
		// 만약 업로드된 파일이 있고, newFileName 속성변수 안에 데이터가 있으면 
		if( multi!=null && !multi.isEmpty() && newFileName != null && newFileName.length() > 0 ) {
			// 새 파일을 생성하기. File 객체를 생성하면 새 파일을 생성할 수 있다.
			File file = new File( upLoadDir + this.newFileName );  // 파일 경로를 포함한 생성파일명
			
			// 업로드한 파일을 새 파일에 전송하여 덮어쓰기
			multi.transferTo(file);
		}
		
	}
	//---------------------------------------------------------------------
	// 파일을 삭제하는 메소드 선언
	//---------------------------------------------------------------------
	public void delete(String filePath) {
		// 삭제할 파일을 관리하는 File 객체 생성
		// 파일 객체의 delete 메소드 호출로 파일 삭제하기
		File file = new File(filePath);
		file.delete();
		
	}
	//---------------------------------------------------------------------
	// 파일을 삭제하는 메소드 선언
	//---------------------------------------------------------------------
	public void delete(String filePath, boolean flag) {
		// 만약, 2번째 매개변수로 들어온 데이터가 true면
		if(flag) {
			// 동료 메소드 중에 delete 메소드 호출하여 파일 삭제하기
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