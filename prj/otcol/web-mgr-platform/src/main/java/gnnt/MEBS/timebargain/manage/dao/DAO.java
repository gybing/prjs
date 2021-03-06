package gnnt.MEBS.timebargain.manage.dao;

import java.io.Serializable;
import java.util.List;

public abstract interface DAO
{
  public abstract List getObjects(Class paramClass);
  
  public abstract Object getObject(Class paramClass, Serializable paramSerializable);
  
  public abstract void saveObject(Object paramObject);
  
  public abstract void removeObject(Class paramClass, Serializable paramSerializable);
}
