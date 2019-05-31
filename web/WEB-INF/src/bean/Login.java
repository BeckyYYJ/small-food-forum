package bean;

import java.util.Date;
import java.util.LinkedList;

public class Login {
   String logname="",
          backNews="";
   int uid=0;
   Date registerTime=null;
   String image="/images/timg.jpg";
   int score;
   String userclass="厨房破坏者";

   int lnum;int tnum;int jhnum;
   public void setLogname(String logname){  
      this.logname = logname;
   }
   public String getLogname(){
      return logname;
   }
   public void setBackNews(String s) {
      backNews = s;
   } 
   public String getBackNews(){
      return backNews;
   }
   public void setimage(String s) {
      image = s;
   }
   public String getImage(){
      return image;
   }

   public void setScore(int s) {
      score = s;
      if(uid==1||uid==2) userclass="管理员";
      else{
      if (score>=100) userclass="米其林特级";
      else if (score>=50) userclass="中华小当家";
      else if(score>=25) userclass="大厨";
      else if(score>=10) userclass="厨房帮工";
      else if(score>=3) userclass="新手学徒";}
   }
   public int getScore(){
      return score;
   }
    public void setUid(int s) {
        uid = s;
    }
    public int getUid(){
        return uid;
    }
    public void setJhnum(int s) {
        jhnum = s;
    }
    public int getJhnum(){
        return jhnum;
    }
    public void setTnum(int s) {
        tnum = s;
    }
    public int getTnum(){
        return tnum;
    }
    public void setLnum(int s) {
        lnum = s;
    }
    public int getLnum(){
        return lnum;
    }
   public String getUserclass(){
        return userclass;
    }
    public void setRegisterTime(Date date) {
        registerTime=date;
    }
    public Date getRegisterTime(){
        return registerTime;
    }
}
