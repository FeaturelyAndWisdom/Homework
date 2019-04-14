package com.ks.po;

public class UserVo {

    private User user;

    private String valicode;

    private String tempanswer;

    private String oldpwd;

    public UserVo() {
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getValicode() {
        return valicode;
    }

    public void setValicode(String valicode) {
        this.valicode = valicode;
    }

    public String getTempanswer() {
        return tempanswer;
    }

    public void setTempanswer(String tempanswer) {
        this.tempanswer = tempanswer;
    }

    public String getOldpwd() {
        return oldpwd;
    }

    public void setOldpwd(String oldpwd) {
        this.oldpwd = oldpwd;
    }
}
