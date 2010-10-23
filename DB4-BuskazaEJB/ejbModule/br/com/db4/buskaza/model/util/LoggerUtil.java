package br.com.db4.buskaza.model.util;

import org.apache.log4j.Logger;

public class LoggerUtil{
       
    public static Logger getLogger(String className)
    {
        return Logger.getLogger(className);
    }
            
    public static void debug(String msg)
    {
        StringBuilder buffer = new StringBuilder();

        String[] strs = getMethodName();
        buffer.append("method=[" + strs[1] + "] ");       
        buffer.append(" ");
        buffer.append(msg);
        LoggerUtil.getLogger(strs[0]).debug(buffer.toString());
    }
    
    public static void error(String msg, Throwable exc)
    {
        StringBuilder buffer = new StringBuilder();

        String[] strs = getMethodName();
        buffer.append("method=[" + strs[1] + "] ");       
        buffer.append(" ");
        buffer.append(msg);
        LoggerUtil.getLogger(strs[0]).error(buffer.toString(), exc);
    }
    
    private static String[] getMethodName()
    {
        StackTraceElement stack[] = (new Throwable()).getStackTrace();
        String method = stack[2].getMethodName();
        String c = stack[2].getClassName();

        String[] strs = new String[2];
        strs[0] = c;
        strs[1] = method;

        return strs;
    }
    
    public static void info(String msg)
    {
        StringBuilder buffer = new StringBuilder();

        String[] strs = getMethodName();
        buffer.append("method=[" + strs[1] + "] ");       
        buffer.append(" ");
        buffer.append(msg);
        LoggerUtil.getLogger(strs[0]).info((buffer.toString()));
    }
}
