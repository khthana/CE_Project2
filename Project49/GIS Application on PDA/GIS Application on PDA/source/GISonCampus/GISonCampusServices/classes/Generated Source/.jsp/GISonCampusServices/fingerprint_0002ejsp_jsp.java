import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.jasper.runtime.*;
import java.io.File;
import java.io.IOException;
import java.util.Date;

public class fingerprint_0002ejsp_jsp extends HttpJspBase {



    /*
     * Fingerprint the users system. This is mainly for use in
     * diagnosing classpath problems. It is intended to dump out
     * a copy of the environment this webapp is running in,
     * and additionally attempt to identify versions of each jar
     * in the classpath.
     *
     * @author Brian Ewins
     */

    private java.util.Properties versionProps=new java.util.Properties();

    /**
     * Identify the version of a jar file. This uses a properties file
     * containing known names and sizes in the format
     * 'name(size)=version'. Version strings should be like 'xerces-1.4'
     * ie they should include the name of the library.
     */
    public String getFileVersion(File file) throws IOException {
        String key="<td>"+file.getName()+"</td>";
        key+= "<td>"+file.length()+"</td>";
        Date timestamp=new Date(file.lastModified());
        key+= "<td>"+timestamp.toString()+"</td>";
        return key;

        /* TODO: implement
        String value=versionProps.getProperty(key);
        if (value==null) {
            // make it possible to have jars without version nos
            value=versionProps.getProperty(file.getName());
        }
        if (value==null) {
            // fall back on something obvious
            value=key;
            Date timestamp=new Date(file.lastModified());
            value+=" / "+timestamp.toString();
        }
        return value;
        */
    }

    /**
     * Split up a classpath-like variable. Returns a list of files.
     * TODO: this can't cope with relative paths. I think theres code in BCEL that
     * can be used for this?
     */
    File[] splitClasspath(String path) throws IOException {
        java.util.StringTokenizer st=
            new java.util.StringTokenizer(path,
                            System.getProperty("path.separator"));
        int toks=st.countTokens();
        File[] files=new File[toks];
        for(int i=0;i<toks;i++) {
            files[i]=new File(st.nextToken());
        }
        return files;
    }

    /** given a list of files, return a list of jars which actually exist */
    File[] scanFiles(File[] files) throws IOException {
        File[] jars=new File[files.length];
        int found=0;
        for (int i=0; i<files.length; i++) {
            if (files[i].getName().toLowerCase().endsWith(".jar")
                    && files[i].exists()) {
                jars[found]=files[i];
                found++;
            }
        }
        if (found<files.length) {
            File[] temp=new File[found];
            System.arraycopy(jars,0,temp,0,found);
            jars=temp;
        }
        return jars;    
    }

    private static final File[] NO_FILES=new File[0];

    /** scan a directory for jars */    
    public File[] scanDir(String dir) throws IOException 
        {
        if(dir==null) {
            return NO_FILES;
        }
        return scanDir(new File(dir));
        }
        
    public File[] scanDir(File dir) throws IOException {
        if (!dir.exists() || !dir.isDirectory()) {
            return NO_FILES;
        }
        return scanFiles(dir.listFiles());
    }

    /** scan a classpath for jars */    
    public File[] scanClasspath(String path) throws IOException {
        if (path==null) {
            return NO_FILES;
        }
        return scanFiles(splitClasspath(path));
    }

    /** 
     * scan a 'dirpath' (like the java.ext.dirs system property) for jars 
     */   
    public File[] scanDirpath(String path) throws IOException {
        if (path==null) {
            return NO_FILES;
        }
        File[] current=new File[0];
        File[] dirs=splitClasspath(path);
        for(int i=0; i<dirs.length; i++) {
            File[] jars=scanDir(dirs[i]);
            File[] temp=new File[current.length+jars.length];
            System.arraycopy(current,0,temp,0,current.length);
            System.arraycopy(jars,0,temp,current.length,jars.length);
            current=temp;
        }
        return scanFiles(current);
    }

    /** print out the jar versions for a directory */
    public void listDirectory(String title, JspWriter out,String dir, String comment) throws IOException {
        listVersions(title, out,scanDir(dir), comment);
    }

    /** print out the jar versions for a directory-like system property */
    public void listDirProperty(String title, JspWriter out,String key, String comment) throws IOException {
        listVersions(title, out,scanDir(System.getProperty(key)), comment);
    }

    /** print out the jar versions for a classpath-like system property */
    public void listClasspathProperty(String title, JspWriter out,String key, String comment) throws IOException {
        listVersions(title, out,scanClasspath(System.getProperty(key)), comment);
    }

    /** print out the jar versions for a 'java.ext.dirs'-like system property */
    public void listDirpathProperty(String title, JspWriter out,String key, String comment) throws IOException {
        listVersions(title, out,scanDirpath(System.getProperty(key)), comment);
    }

    /** print out the jar versions for a context-relative directory */
    public void listContextPath(String title, JspWriter out, String path, String comment)  throws IOException {
        listVersions(title, out,scanDir(getServletConfig().getServletContext().getRealPath(path)), comment);
    }

    /** print out the jar versions for a given list of files */
    public void listVersions(String title, JspWriter out,File[] jars, String comment) throws IOException {
        out.print("<h2>");
        out.print(title);
        out.println("</h2>");
        out.println("<table>");
        for (int i=0; i<jars.length; i++) {
            out.println("<tr>"+getFileVersion(jars[i])+"</tr>");
        }
        out.println("</table>");
        if(comment!=null && comment.length()>0) {
            out.println("<p>");
            out.println(comment);
            out.println("<p>");
        }
    }



  private static java.util.Vector _jspx_includes;

  public java.util.List getIncludes() {
    return _jspx_includes;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    javax.servlet.jsp.PageContext pageContext = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html;charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, false, 8192, true);
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>System Fingerprint");
      out.write("</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=#ffffff>\r\n");
      out.write("\r\n");
      out.write("<h1>System Fingerprint");
      out.write("</h1>\r\n");
      out.write("<h2>JVM and Server Version");
      out.write("</h2>\r\n");
      out.write("<table>\r\n");
      out.write("<tr>\r\n    ");
      out.write("<td>Servlet Engine");
      out.write("</td>\r\n    ");
      out.write("<td>");
      out.print( getServletConfig().getServletContext().getServerInfo() );
      out.write("</td>\r\n    ");
      out.write("<td>");
      out.print( getServletConfig().getServletContext().getMajorVersion() );
      out.write("</td>\r\n    ");
      out.write("<td>");
      out.print( getServletConfig().getServletContext().getMinorVersion() );
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n    ");
      out.write("<td>Java VM");
      out.write("</td>\r\n    ");
      out.write("<td>");
      out.print( System.getProperty("java.vm.vendor") );
      out.write("</td>\r\n    ");
      out.write("<td>");
      out.print( System.getProperty("java.vm.name") );
      out.write("</td>\r\n    ");
      out.write("<td>");
      out.print( System.getProperty("java.vm.version") );
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n    ");
      out.write("<td>Java RE");
      out.write("</td>\r\n    ");
      out.write("<td>");
      out.print( System.getProperty("java.vendor") );
      out.write("</td>\r\n    ");
      out.write("<td>");
      out.print( System.getProperty("java.version") );
      out.write("</td>\r\n    ");
      out.write("<td> ");
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n    ");
      out.write("<td>Platform");
      out.write("</td>\r\n    ");
      out.write("<td>");
      out.print( System.getProperty("os.name") );
      out.write("</td>\r\n    ");
      out.write("<td>");
      out.print( System.getProperty("os.arch") );
      out.write("</td>\r\n    ");
      out.write("<td>");
      out.print( System.getProperty("os.version") );
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n\r\n");

listClasspathProperty("Boot jars", out,"sun.boot.class.path", "Only valid on a sun jvm");
listClasspathProperty("System jars", out,"java.class.path", null);
listDirpathProperty("Extra system jars", out,"java.ext.dirs", null);
listContextPath("Webapp jars", out, "/WEB-INF/lib", null);
// identify the container...
String container=getServletConfig().getServletContext().getServerInfo();
if (container.startsWith("Tomcat Web Server/3.2")) {
    String home=System.getProperty("tomcat.home");
    if(home!=null) {
        listDirectory("Tomcat 3.2 Common Jars", out,
                      home+File.separator
                      +"lib",
                      null);
    }
} else if (container.startsWith("Tomcat Web Server/3.3")) {
    String home=System.getProperty("tomcat.home");
    if(home!=null) {
        listDirectory("Tomcat 3.3 Container Jars", out,
                      home+File.separator
                      +"lib"+File.separator
                      +"container",
                      null);
        listDirectory("Tomcat 3.3 Common Jars", out,
                      home+File.separator
                      +"lib"+File.separator
                      +"common",
                      null);
    }
} else if (container.startsWith("Apache Tomcat/4.0")) {
    //handle catalina common dir
    String home=System.getProperty("catalina.home");
    if(home!=null) {
        listDirectory("Tomcat 4.0 Common Jars", out,
                      home+File.separator
                      +"common"+File.separator
                      +"lib",
                      null);
    }
} else if (container.startsWith("Apache Tomcat/4.1")) {
    //handle catalina common dir
    String home=System.getProperty("catalina.home");
    if(home!=null) {
        listDirectory("Tomcat 4.1 Common Jars", out,
                      home+File.separator
                      +"shared"+File.separator
                      +"lib",
                      null);
    }
} else if (System.getProperty("resin.home")!=null) {
    String home=System.getProperty("resin.home");
    if(home!=null) {
        listDirectory("Resin Common Jars", out,
                      home+File.separator
                      +"lib",
                      null);
    }    
} else if (System.getProperty("weblogic.httpd.servlet.classpath")!=null) {
    listClasspathProperty("Weblogic Servlet Jars", out,
                  "weblogic.httpd.servlet.classpath",
                  null);
} else {
    //TODO: identify more servlet engine classpaths.
}

      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      out = _jspx_out;
      if (out != null && out.getBufferSize() != 0)
        out.clearBuffer();
      if (pageContext != null) pageContext.handlePageException(t);
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(pageContext);
    }
  }
}
