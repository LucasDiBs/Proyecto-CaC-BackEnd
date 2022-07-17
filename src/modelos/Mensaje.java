package modelos;

public class Mensaje {
	private String tipoMensaje;
	private String textoMensaje;
	private String regreso;
	
	public Mensaje(String tipoMensaje, String textoMensaje, String regreso) {
		this.tipoMensaje = tipoMensaje;
		this.textoMensaje = textoMensaje;
		this.regreso = regreso;
	}
	
	public String getTipoMensaje() {
		return tipoMensaje;
	}
	public String getTextoMensaje() {
		return textoMensaje;
	}
	public String getRegreso() {
		return regreso;
	}
}
