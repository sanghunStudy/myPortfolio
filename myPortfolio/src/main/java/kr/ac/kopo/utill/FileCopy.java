package kr.ac.kopo.utill;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class FileCopy {
	// 파일 복사
	public boolean nioFileCopy(String inFileName, String outFileName) {
		Path source = Paths.get(inFileName);
		Path target = Paths.get(outFileName);

		//파일여부 체크
		if (source == null) {
			throw new IllegalArgumentException("복사할 파일을 지정해주세요");
		}
		if (target == null) {
			throw new IllegalArgumentException("복사할 경로를 지정해주세요");
		}

		// 소스파일이 실제로 존재하는지 체크
		if (!Files.exists(source, new LinkOption[] {})) {
			throw new IllegalArgumentException("복사할 파일이 존재하지 않습니다"
					+ source.toString());
		}

		
		try {
			Files.copy(source, target, StandardCopyOption.REPLACE_EXISTING); // 파일복사

		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		 // 파일 생성 결과 리턴
		if (Files.exists(target, new LinkOption[] {})) {
			return true;
		} else {
			return false;
		}
	}
}
