package thirdproject;
import java.util.Date;


public class Reservation {
	private Date entryDate;
    private Date exitDate;
    private static final int DAILY_RATE = 10000; // 하루 주차 요금
    private static final int MONTH_RATE = 150000;

    public Reservation(Date entryDate, Date exitDate) {
        this.entryDate = entryDate;
        this.exitDate = exitDate;
    }
    //장기 주차요금에 할인 
    public double CalculateParkingsale() {
    	 long millisecondsPerDay = 1000 * 60 * 60 * 24;
         long durationInMillis = exitDate.getTime() - entryDate.getTime();
         int days = (int) Math.ceil((double) durationInMillis / millisecondsPerDay);
         if(days <=7) {
        	 return days * DAILY_RATE;
         }else if(days==30 || days==31){
        	 return parkingMonth();
         }else{
        	 return days * DAILY_RATE * 0.7 ;
         	  }
         }
    //정기권 차량 등록
    public int parkingMonth() {
    	return MONTH_RATE;
    }
    
}