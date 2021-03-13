package com.lubway.user.controller;

import java.io.File;

public class Main {
	
	public AwsS3 awsS3 = AwsS3.getInstance();

	//테스트 클래스 입니다.
	public static void main(String[] args) {

		Main main = new Main();

		File file = new File("C:\\myProject\\test.png"); //원 파일 경로 + 파일명
		String key = "lubway_test.png"; // 저장될 파일명
		String copyKey = "my-img-copy.png"; // 복사할시 저장될 파일 명

		main.upload(file, key);
//        main.copy(key, copyKey);
//        main.delete(key);
	}

	/**
	 * 업로드 메서드
	 * @param file
	 * @param key
	 */
	public void upload(File file, String key) {
		awsS3.upload(file, key);
	}

	/**
	 * 복사 메서드
	 * @param orgKey
	 * @param copyKey
	 */
	public void copy(String orgKey, String copyKey) {
		awsS3.copy(orgKey, copyKey);
	}

	/**
	 * 삭제 메서드
	 * @param key
	 */
	public void delete(String key) {
		awsS3.delete(key);
	}
}
