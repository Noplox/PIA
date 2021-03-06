package db;
// Generated Feb 12, 2017 2:00:16 PM by Hibernate Tools 4.3.1



/**
 * Comment generated by hbm2java
 */
public class Comment  implements java.io.Serializable {


     private Integer idcomment;
     private FestivalGroup festivalGroup;
     private User user;
     private String content;
     private int rating;

    public Comment() {
    }

    public Comment(FestivalGroup festivalGroup, User user, String content, int rating) {
       this.festivalGroup = festivalGroup;
       this.user = user;
       this.content = content;
       this.rating = rating;
    }
   
    public Integer getIdcomment() {
        return this.idcomment;
    }
    
    public void setIdcomment(Integer idcomment) {
        this.idcomment = idcomment;
    }
    public FestivalGroup getFestivalGroup() {
        return this.festivalGroup;
    }
    
    public void setFestivalGroup(FestivalGroup festivalGroup) {
        this.festivalGroup = festivalGroup;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    public int getRating() {
        return this.rating;
    }
    
    public void setRating(int rating) {
        this.rating = rating;
    }




}


