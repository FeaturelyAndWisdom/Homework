package com.ks.po;

import java.util.Date;
import java.util.List;

public class Gushi {

    private int gid;

    private String title;

    private String author;

    private String word;

    private String pinyin;

    private Date createtime;

    private int isdel;

    /**************辅助字段**************/

    private String[] wlines;

    private List<String[]> pys;

    public Gushi() {
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
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

    public String[] getWlines() {
        return wlines;
    }

    public void setWlines(String[] wlines) {
        this.wlines = wlines;
    }

    public List<String[]> getPys() {
        return pys;
    }

    public void setPys(List<String[]> pys) {
        this.pys = pys;
    }

    public int getIsdel() {
        return isdel;
    }

    public void setIsdel(int isdel) {
        this.isdel = isdel;
    }
}
