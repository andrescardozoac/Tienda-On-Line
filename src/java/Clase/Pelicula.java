
package Clase;


public class Pelicula {
    private String CodigoP;
    private String ClasificacionPelicula;
    private String GeneroPelicula;
    private String Titulo;
    private int Cantidad;
    private String Descripcion;
    private double PrecioP;
    private String ImagenP;
    private String EstadoP;

    public Pelicula() {
    }

    
    
    public Pelicula(String CodigoP, String ClasificacionPelicula, String GeneroPelicula, String Titulo, String Descripcion, double PrecioP, String ImagenP, String EstadoP) {
        this.CodigoP = CodigoP;
        this.ClasificacionPelicula = ClasificacionPelicula;
        this.GeneroPelicula = GeneroPelicula;
        this.Titulo = Titulo;
        this.Descripcion = Descripcion;
        this.PrecioP = PrecioP;
        this.ImagenP = ImagenP;
        this.EstadoP = EstadoP;
    }

    public Pelicula(String CodigoP, String ClasificacionPelicula, String GeneroPelicula, String Titulo, int Cantidad, String Descripcion, double PrecioP, String ImagenP, String EstadoP) {
        this.CodigoP = CodigoP;
        this.ClasificacionPelicula = ClasificacionPelicula;
        this.GeneroPelicula = GeneroPelicula;
        this.Titulo = Titulo;
        this.Cantidad = Cantidad;
        this.Descripcion = Descripcion;
        this.PrecioP = PrecioP;
        this.ImagenP = ImagenP;
        this.EstadoP = EstadoP;
    }
    
    

    public String getCodigoP() {
        return CodigoP;
    }

    public void setCodigoP(String CodigoP) {
        this.CodigoP = CodigoP;
    }

    
    public String getClasificacionPelicula() {
        return ClasificacionPelicula;
    }

    public void setClasificacionPelicula(String ClasificacionPelicula) {
        this.ClasificacionPelicula = ClasificacionPelicula;
    }

    public String getGeneroPelicula() {
        return GeneroPelicula;
    }

    public void setGeneroPelicula(String GeneroPelicula) {
        this.GeneroPelicula = GeneroPelicula;
    }

    public String getTitulo() {
        return Titulo;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }
    
    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public double getPrecioP() {
        return PrecioP;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }
    
    

    public void setPrecioP(double PrecioP) {
        this.PrecioP = PrecioP;
    }

    public String getImagenP() {
        return ImagenP;
    }

    public void setImagenP(String ImagenP) {
        this.ImagenP = ImagenP;
    }

    public String getEstadoP() {
        return EstadoP;
    }

    public void setEstadoP(String EstadoP) {
        this.EstadoP = EstadoP;
    }

    

}
