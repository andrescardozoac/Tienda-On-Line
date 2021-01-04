
package Clase;


public class DetalleVenta {
    private String numero;
    private String CodigoVenta;
    private String codigoPelicula;
    private String TituloPelicula;
    private String SinopsisPelicula;
    private String NombreUsuario;
    private String CodigoUsuario;
    private double Precio;
    private double Cantidad;
    private double Descuento;
    private double SubTotal;
    private String Estado;
    private Pelicula Pelicula;
    private Venta Venta;
    private Usuario usuario;

    public DetalleVenta() {
    }

    public DetalleVenta(String numero, String CodigoVenta, String codigoPelicula, String TituloPelicula, String SinopsisPelicula, String NombreUsuario, String CodigoUsuario, double Precio, double Cantidad, double Descuento, double SubTotal, String Estado, Pelicula Pelicula, Venta Venta, Usuario usuario) {
        this.numero = numero;
        this.CodigoVenta = CodigoVenta;
        this.codigoPelicula = codigoPelicula;
        this.TituloPelicula = TituloPelicula;
        this.SinopsisPelicula = SinopsisPelicula;
        this.NombreUsuario = NombreUsuario;
        this.CodigoUsuario = CodigoUsuario;
        this.Precio = Precio;
        this.Cantidad = Cantidad;
        this.Descuento = Descuento;
        this.SubTotal = SubTotal;
        this.Estado = Estado;
        this.Pelicula = Pelicula;
        this.Venta = Venta;
        this.usuario = usuario;
    }


    
    public DetalleVenta(String numero, String CodigoVenta, String codigoPelicula, String TituloPelicula ,String SinopsisPelicula, double Precio, double Cantidad, double Descuento, double SubTotal, Pelicula Pelicula, Venta Venta) {
        this.numero = numero;
        this.CodigoVenta = CodigoVenta;
        this.codigoPelicula = codigoPelicula;
        this.TituloPelicula = TituloPelicula;
        this.SinopsisPelicula = SinopsisPelicula;
        this.Precio = Precio;
        this.Cantidad = Cantidad;
        this.Descuento = Descuento;
        this.SubTotal = SubTotal;
        this.Pelicula = Pelicula;
        this.Venta = Venta;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getCodigoVenta() {
        return CodigoVenta;
    }

    public void setCodigoVenta(String CodigoVenta) {
        this.CodigoVenta = CodigoVenta;
    }

    public String getCodigoPelicula() {
        return codigoPelicula;
    }

    public void setCodigoPelicula(String codigoPelicula) {
        this.codigoPelicula = codigoPelicula;
    }

    public String getCodigoUsuario() {
        return CodigoUsuario;
    }

    public void setCodigoUsuario(String CodigoUsuario) {
        this.CodigoUsuario = CodigoUsuario;
    }

    
    
       public String getTituloPelicula() {
        return TituloPelicula;
    }

    public void setTituloPelicula(String TituloPelicula) {
        this.TituloPelicula = TituloPelicula;
    }
    
    public String getSinopsisPelicula() {
        return SinopsisPelicula;
    }

    public void setSinopsisPelicula(String SinopsisPelicula) {
        this.SinopsisPelicula = SinopsisPelicula;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }

    public double getCantidad() {
        return Cantidad;
    }

    public void setCantidad(double Cantidad) {
        this.Cantidad = Cantidad;
    }

    public double getDescuento() {
        return Descuento;
    }

    public void setDescuento(double Descuento) {
        this.Descuento = Descuento;
    }

    public double getSubTotal() {
        return SubTotal;
    }

    public void setSubTotal(double SubTotal) {
        this.SubTotal = SubTotal;
    }

    public Pelicula getPelicula() {
        return Pelicula;
    }

    public void setPelicula(Pelicula Pelicula) {
        this.Pelicula = Pelicula;
    }

    public Venta getVenta() {
        return Venta;
    }

    public void setVenta(Venta Venta) {
        this.Venta = Venta;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getNombreUsuario() {
        return NombreUsuario;
    }

    public void setNombreUsuario(String NombreUsuario) {
        this.NombreUsuario = NombreUsuario;
    }
    
    

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    
    
}
