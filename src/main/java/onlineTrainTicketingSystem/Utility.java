

//source: <%--Soruce: https://github.com/rplano/book4_internet/ --%>

package onlineTrainTicketingSystem;

import java.awt.Color;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletRequest;

public class Utility {

    public static String createJavaScriptFromObject(Object o) {
        StringBuilder js = new StringBuilder();
        js.append("<script>");
        js.append("function fillFormFromJS() {");
        js.append("var map = {");

        try {
            Field[] flds = o.getClass().getDeclaredFields();
            for (Field f : flds) {
                f.setAccessible(true);
                String key = f.getName();
                Object value = f.get(o);
                if (value != null) {
                    js.append("'").append(key).append("': '").append(value.toString()).append("',");
                }
            }

        } catch (Exception e) {
            System.err.println(e);
        }

        js.append("};");
        js.append("for(var key in map) {");
        js.append("    document.getElementsByName(key)[0].value = map[key];");
        js.append("}");
        js.append("}");
        js.append("</script>");
        return js.toString();
    }

    public static Object extractObjectFromRequest(Class<?> c, HttpServletRequest request) {
        Object o = null;
        try {
            o = c.getDeclaredConstructor().newInstance();
            Field[] flds = c.getDeclaredFields();
            for (Field f : flds) {
                String param = request.getParameter(f.getName());
                if (param != null && !param.isEmpty()) {
                    f.setAccessible(true);
                    Object par = null;
                    if (f.getType().equals(String.class)) {
                        par = param;
                    } else if (f.getType().equals(Integer.class)) {
                        par = Integer.parseInt(param);
                    } else if (f.getType().equals(Long.class)) {
                        par = Long.parseLong(param);
                    } else if (f.getType().equals(Double.class)) {
                        par = Double.parseDouble(param);
                    } else if (f.getType().equals(Boolean.class)) {
                        par = Boolean.parseBoolean(param);
                    } else if (f.getType().equals(Color.class)) {
                        par = convertColorFromString(param);
                    } else if (f.getType().equals(Date.class)) {
                        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                        par = format.parse(param);
                    }
                    if (par != null) {
                        f.set(o, par);
                    }
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return o;
    }

    private static Color convertColorFromString(String colorName) {
        try {
            Field[] fields = Color.class.getFields();
            for (Field field : fields) {
                if (field.getType().equals(Color.class) && field.getName().equalsIgnoreCase(colorName)) {
                    return (Color) field.get(null);
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return null;
    }
}
