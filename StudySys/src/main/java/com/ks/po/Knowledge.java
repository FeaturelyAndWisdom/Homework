package com.ks.po;

import java.util.Date;

public class Knowledge {

    private int kid;

    private String word;

    private String pinyin;

    private Date createtime;

    private int type;

    private int isdel;

    /***********辅助字段***************/

    private String[] pys;

    public Knowledge() {
    }

    public int getKid() {
        return kid;
    }

    public void setKid(int kid) {
        this.kid = kid;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getPinyin() {
        return pinyin;
    }

    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String[] getPys() {
        return pys;
    }

    public void setPys(String[] pys) {
        this.pys = pys;
    }

    public int getIsdel() {
        return isdel;
    }

    public void setIsdel(int isdel) {
        this.isdel = isdel;
    }
}
