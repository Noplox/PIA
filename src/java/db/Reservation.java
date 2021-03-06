package db;
// Generated Feb 12, 2017 2:00:16 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Reservation generated by hbm2java
 */
public class Reservation  implements java.io.Serializable {


     private Integer idreservation;
     private Day day;
     private User user;
     private Date reservationTime;
     private int numberOfTickets;
     private Integer status;
     private Byte bundle;

    public Reservation() {
    }

	
    public Reservation(Day day, User user, int numberOfTickets) {
        this.day = day;
        this.user = user;
        this.numberOfTickets = numberOfTickets;
    }
    public Reservation(Day day, User user, Date reservationTime, int numberOfTickets, Integer status, Byte bundle) {
       this.day = day;
       this.user = user;
       this.reservationTime = reservationTime;
       this.numberOfTickets = numberOfTickets;
       this.status = status;
       this.bundle = bundle;
    }
   
    public Integer getIdreservation() {
        return this.idreservation;
    }
    
    public void setIdreservation(Integer idreservation) {
        this.idreservation = idreservation;
    }
    public Day getDay() {
        return this.day;
    }
    
    public void setDay(Day day) {
        this.day = day;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public Date getReservationTime() {
        return this.reservationTime;
    }
    
    public void setReservationTime(Date reservationTime) {
        this.reservationTime = reservationTime;
    }
    public int getNumberOfTickets() {
        return this.numberOfTickets;
    }
    
    public void setNumberOfTickets(int numberOfTickets) {
        this.numberOfTickets = numberOfTickets;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    public Byte getBundle() {
        return this.bundle;
    }
    
    public void setBundle(Byte bundle) {
        this.bundle = bundle;
    }




}


