
package Clase;

public class Tienda {
    
    String codTienda;
    String nombreTienda;
    String direccionT;

    public Tienda(String codTienda, String nombreTienda, String direccionT) {
        this.codTienda = codTienda;
        this.nombreTienda = nombreTienda;
        this.direccionT = direccionT;
    }
    
    public Tienda(){}

    public String getCodTienda() {
        return codTienda;
    }

    public void setCodTienda(String codTienda) {
        this.codTienda = codTienda;
    }

    public String getNombreTienda() {
        return nombreTienda;
    }

    public void setNombreTienda(String nombreTienda) {
        this.nombreTienda = nombreTienda;
    }

    public String getDireccionT() {
        return direccionT;
    }

    public void setDireccionT(String direccionT) {
        this.direccionT = direccionT;
    }
    
    
}
