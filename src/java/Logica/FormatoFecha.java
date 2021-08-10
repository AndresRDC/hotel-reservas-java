package Logica;

import Servlets.SvEmpleadoRegistrar;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


public class FormatoFecha {
    private static SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
    
    public static Date textoAFecha(String fechaString){
        Date fecha = new Date();
        try {
            fecha = formato.parse(fechaString);
        } catch (ParseException ex) {
            Logger.getLogger(SvEmpleadoRegistrar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fecha;
    }

    public static String fechaATexto(Date fecha){
        String fechaString = formato.format(fecha);
        return fechaString;
    }
    
    public static String textoATextoDiaMesAnio(String fechaString){
        Date fecha = new Date();
        try {
            fecha = formato.parse(fechaString);
        } catch (ParseException ex) {
            Logger.getLogger(SvEmpleadoRegistrar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fechaATextoDiaMesAnio(fecha);
    }
    public static String fechaATextoDiaMesAnio(Date fecha){
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        String fechaStringDMA = formato.format(fecha);
        return fechaStringDMA;
    }
}
