/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Cliente extends Persona implements Serializable{
    @Basic
    private String tipo;
    
    public Cliente() {
    }

    public Cliente(String tipo, long id, Date fechaNacimiento, String nombre, String apellido, String direccion, String profesion, String dni) {
        super(id, fechaNacimiento, nombre, apellido, direccion, profesion, dni);
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }


}
