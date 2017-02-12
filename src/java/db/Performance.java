package db;
// Generated Feb 12, 2017 2:00:16 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Performance generated by hbm2java
 */
public class Performance  implements java.io.Serializable {


     private Integer idartist;
     private Festival festival;
     private String name;
     private Date startDate;
     private Date endDate;
     private Date startTime;
     private Date endTime;

    public Performance() {
    }

    public Performance(Festival festival, String name, Date startDate, Date endDate, Date startTime, Date endTime) {
       this.festival = festival;
       this.name = name;
       this.startDate = startDate;
       this.endDate = endDate;
       this.startTime = startTime;
       this.endTime = endTime;
    }
   
    public Integer getIdartist() {
        return this.idartist;
    }
    
    public void setIdartist(Integer idartist) {
        this.idartist = idartist;
    }
    public Festival getFestival() {
        return this.festival;
    }
    
    public void setFestival(Festival festival) {
        this.festival = festival;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Date getStartDate() {
        return this.startDate;
    }
    
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    public Date getEndDate() {
        return this.endDate;
    }
    
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    public Date getStartTime() {
        return this.startTime;
    }
    
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }
    public Date getEndTime() {
        return this.endTime;
    }
    
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }




}

