package Clase;


public class ClasificacionP {
    private String CodigoCP;
    private String NombreCP;
    private String EstadoCP;

    public ClasificacionP() {
    }

    public ClasificacionP(String CodigoCP, String NombreCP, String EstadoCP) {
        this.CodigoCP = CodigoCP;
        this.NombreCP = NombreCP;
        this.EstadoCP = EstadoCP;
    }

    public String getCodigoCP() {
        return CodigoCP;
    }

    public void setCodigoCP(String CodigoCP) {
        this.CodigoCP = CodigoCP;
    }

    public String getNombreCP() {
        return NombreCP;
    }

    public void setNombreCP(String NombreCP) {
        this.NombreCP = NombreCP;
    }

    public String getEstadoCP() {
        return EstadoCP;
    }

    public void setEstadoCP(String EstadoCP) {
        this.EstadoCP = EstadoCP;
    }
    
    
    
}
