package db;
// Generated Feb 12, 2017 2:00:16 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Day generated by hbm2java
 */
public class Day  implements java.io.Serializable {


     private Integer idTicket;
     private Festival festival;
     private int day;
     private int ticketsRemaining;
     private int price;
     private Set<Reservation> reservations = new HashSet<Reservation>(0);

    public Day() {
    }

	
    public Day(Festival festival, int day, int ticketsRemaining, int price) {
        this.festival = festival;
        this.day = day;
        this.ticketsRemaining = ticketsRemaining;
        this.price = price;
    }
    public Day(Festival festival, int day, int ticketsRemaining, int price, Set<Reservation> reservations) {
       this.festival = festival;
       this.day = day;
       this.ticketsRemaining = ticketsRemaining;
       this.price = price;
       this.reservations = reservations;
    }
   
    public Integer getIdTicket() {
        return this.idTicket;
    }
    
    public void setIdTicket(Integer idTicket) {
        this.idTicket = idTicket;
    }
    public Festival getFestival() {
        return this.festival;
    }
    
    public void setFestival(Festival festival) {
        this.festival = festival;
    }
    public int getDay() {
        return this.day;
    }
    
    public void setDay(int day) {
        this.day = day;
    }
    public int getTicketsRemaining() {
        return this.ticketsRemaining;
    }
    
    public void setTicketsRemaining(int ticketsRemaining) {
        this.ticketsRemaining = ticketsRemaining;
    }
    public int getPrice() {
        return this.price;
    }
    
    public void setPrice(int price) {
        this.price = price;
    }
    public Set<Reservation> getReservations() {
        return this.reservations;
    }
    
    public void setReservations(Set<Reservation> reservations) {
        this.reservations = reservations;
    }




}


