package kr.co.moebius.movie;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileUploadCommand {
	private CommonsMultipartFile upFile;

	public CommonsMultipartFile getUpFile() {
		return upFile;
	}

	public void setUpFile(CommonsMultipartFile upFile) {
		this.upFile = upFile;
	}
	
}
