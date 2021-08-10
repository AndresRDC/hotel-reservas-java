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
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Empleado extends Persona implements Serializable {
    @Basic
    private String cargo;
    private String usuario;
    private String password;

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Empleado(String cargo, String usuario, String password) {
        this.cargo = cargo;
        this.usuario = usuario;
        this.password = password;
    }

    public Empleado(String cargo, String usuario, String password, long id, Date fechaNacimiento, String nombre, String apellido, String direccion, String profesion, String dni) {
        super(id, fechaNacimiento, nombre, apellido, direccion, profesion, dni);
        this.cargo = cargo;
        this.usuario = usuario;
        this.password = password;
    }
    

    public Empleado() {
    }
}
