package top.lyxwachs.bean;

public class BlogFriendlyLinks {
    private Integer flId;

    private String flUrl;

    private String flText;

    private Integer createUser;

    public Integer getFlId() {
        return flId;
    }

    public void setFlId(Integer flId) {
        this.flId = flId;
    }

    public String getFlUrl() {
        return flUrl;
    }

    public void setFlUrl(String flUrl) {
        this.flUrl = flUrl == null ? null : flUrl.trim();
    }

    public String getFlText() {
        return flText;
    }

    public void setFlText(String flText) {
        this.flText = flText == null ? null : flText.trim();
    }

    public Integer getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Integer createUser) {
        this.createUser = createUser;
    }
}