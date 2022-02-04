package com.jhta.moviefan.form;

public class CriteriaMyAccount {

	private int customerNo;
	private String opt;
	private String value;
	private int beginIndex;
	private int endIndex;
	
	public CriteriaMyAccount() {}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getBeginIndex() {
		return beginIndex;
	}

	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	@Override
	public String toString() {
		return "CriteriaMyAccount [customerNo=" + customerNo + ", opt=" + opt + ", value=" + value + ", beginIndex="
				+ beginIndex + ", endIndex=" + endIndex + "]";
	}

}
