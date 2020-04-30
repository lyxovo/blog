package top.lyxwachs.bean;

public class BlogWithBLOBs extends Blog {
    private String bContent;

    private String bContenttext;
    
    private String createDate; //创的数据属性，用来存创建的日期的String格式。
    
    private String updateDate;
    
    private BlogCategory blogCategory;//多对一（一对一）博客，使用在mybatis中
    
    public BlogCategory getBlogCategory() {
		return blogCategory;
	}

	public void setBlogCategory(BlogCategory blogCategory) {
		this.blogCategory = blogCategory;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getbContent() {
        return bContent;
    }

    public void setbContent(String bContent) {
        this.bContent = bContent == null ? null : bContent.trim();
    }

    public String getbContenttext() {
        return bContenttext;
    }

    public void setbContenttext(String bContenttext) {
        this.bContenttext = bContenttext == null ? null : bContenttext.trim();
    }
}