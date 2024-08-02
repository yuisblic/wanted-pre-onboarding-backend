package kr.bit.entity;

import lombok.Data;

@Data
public class Company {
	private String companyID;
	private String companyPwd;
	private String companyName;
	private String nation;
	private String region;
}
