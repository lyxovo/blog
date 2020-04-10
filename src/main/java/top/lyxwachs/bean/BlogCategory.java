package top.lyxwachs.bean;

public class BlogCategory {
    private Integer categoryId;

    private String categoryName;

    private Integer categoryNumber;

    private Integer bId;

    private Byte cLive;

    private Integer uId;

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public Integer getCategoryNumber() {
        return categoryNumber;
    }

    public void setCategoryNumber(Integer categoryNumber) {
        this.categoryNumber = categoryNumber;
    }

    public Integer getbId() {
        return bId;
    }

    public void setbId(Integer bId) {
        this.bId = bId;
    }

    public Byte getcLive() {
        return cLive;
    }

    public void setcLive(Byte cLive) {
        this.cLive = cLive;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }
    
    @Override
	public boolean equals(Object o) {
		if (o instanceof BlogCategory) {
			BlogCategory blogCategory = (BlogCategory) o;
			return 
//					this.categoryId.equals(blogCategory.categoryId)&&
					 this.categoryName.equals(blogCategory.categoryName)
//					&& this.categoryNumber.equals(blogCategory.categoryNumber)
//					&& this.bId.equals(blogCategory.bId)
//					&& this.cLive.equals(blogCategory.cLive)
					&& this.uId.equals(blogCategory.uId);
		}
		return super.equals(o);
	}

    
}