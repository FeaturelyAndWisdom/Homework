package com.qq.bean;

import java.io.Serializable;

public class Friend implements Serializable {
    private String userAccount;
    private String friendAccount;
    
    public Friend() {
		// TODO Auto-generated constructor stub
	}
    
	public String getFriendAccount() {
		return friendAccount;
	}
	public void setFriendAccount(String friendAccount) {
		this.friendAccount = friendAccount;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
}
