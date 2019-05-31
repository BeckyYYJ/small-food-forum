package bean;
//import com.sun.rowset.*;

import javax.sql.rowset.CachedRowSet;

public class DataByPage {
    CachedRowSet rowSet=null;

    public void setRowSet(CachedRowSet set){
       rowSet=set;
    }
    public CachedRowSet getRowSet(){
       return rowSet;
    }
}
