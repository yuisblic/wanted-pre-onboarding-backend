package kr.bit.entity;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	  private int idx; // 번호
	  private String companyID; // 회원ID
	  private String companyName; // 회사명
	  private String nation; // 국가
	  private String region; // 지역
	  private String position; // 채용포지션
	  private String reward; // 채용보상금
	  private String skill; // 사용기술
	  private String content; // 내용
}
