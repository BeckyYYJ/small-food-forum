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
   String userclass="�����ƻ���";

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
      if(uid==1||uid==2) userclass="����Ա";
      else{
      if (score>=100) userclass="�������ؼ�";
      else if (score>=50) userclass="�л�С����";
      else if(score>=25) userclass="���";
      else if(score>=10) userclass="�����﹤";
      else if(score>=3) userclass="����ѧͽ";}
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
