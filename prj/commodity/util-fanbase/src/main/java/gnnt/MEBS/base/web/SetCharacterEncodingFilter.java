package gnnt.MEBS.base.web;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class SetCharacterEncodingFilter
  implements Filter
{
  public void init(FilterConfig arg0)
    throws ServletException
  {}
  
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    throws IOException, ServletException
  {
    request.setCharacterEncoding("GBK");
    

    chain.doFilter(request, response);
  }
  
  public void destroy() {}
}
