package top.lyxwachs.bean;

import java.util.Date;

public class Blog {
    private Integer bId;

    private String bPicture;

    private String bTitle;

    private String bContent;

    private Integer bAuthor;

    private Date bCreatedate;

    private Date bCreateupdate;

    private Integer bVisitors;

    private Integer bDiscuss;

    public Integer getbId() {
        return bId;
    }

    public void setbId(Integer bId) {
        this.bId = bId;
    }

    public String getbPicture() {
        return bPicture;
    }

    public void setbPicture(String bPicture) {
        this.bPicture = bPicture == null ? null : bPicture.trim();
    }

    public String getbTitle() {
        return bTitle;
    }

    public void setbTitle(String bTitle) {
        this.bTitle = bTitle == null ? null : bTitle.trim();
    }

    public String getbContent() {
        return bContent;
    }

    public void setbContent(String bContent) {
        this.bContent = bContent == null ? null : bContent.trim();
    }

    public Integer getbAuthor() {
        return bAuthor;
    }

    public void setbAuthor(Integer bAuthor) {
        this.bAuthor = bAuthor;
    }

    public Date getbCreatedate() {
        return bCreatedate;
    }

    public void setbCreatedate(Date bCreatedate) {
        this.bCreatedate = bCreatedate;
    }

    public Date getbCreateupdate() {
        return bCreateupdate;
    }

    public void setbCreateupdate(Date bCreateupdate) {
        this.bCreateupdate = bCreateupdate;
    }

    public Integer getbVisitors() {
        return bVisitors;
    }

    public void setbVisitors(Integer bVisitors) {
        this.bVisitors = bVisitors;
    }

    public Integer getbDiscuss() {
        return bDiscuss;
    }

    public void setbDiscuss(Integer bDiscuss) {
        this.bDiscuss = bDiscuss;
    }
}