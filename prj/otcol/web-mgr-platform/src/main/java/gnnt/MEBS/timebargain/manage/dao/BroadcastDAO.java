package gnnt.MEBS.timebargain.manage.dao;

import gnnt.MEBS.timebargain.manage.model.Broadcast;
import java.util.List;

public abstract interface BroadcastDAO
  extends DAO
{
  public abstract Broadcast getBroadcastById(Long paramLong);
  
  public abstract List getBroadcasts(Broadcast paramBroadcast);
  
  public abstract void insertBroadcast(Broadcast paramBroadcast);
  
  public abstract void updateBroadcast(Broadcast paramBroadcast);
  
  public abstract void deleteBroadcastById(Long paramLong);
  
  public abstract List getHisBroadcast(String paramString);
  
  public abstract void hisBroadcast();
  
  public abstract void insertHisBroadcast(Broadcast paramBroadcast);
  
  public abstract List getBroadcastWait();
  
  public abstract Broadcast getBroadcastWaitById(Long paramLong);
  
  public abstract void updateBroadcastWait(Broadcast paramBroadcast);
  
  public abstract void deleteBroadcastWaitById(Long paramLong);
  
  public abstract List getBroadcastAready();
  
  public abstract void deleteBroadcastAreadyById(Long paramLong);
  
  public abstract Broadcast getHisBroadcastByKye(Broadcast paramBroadcast);
}
