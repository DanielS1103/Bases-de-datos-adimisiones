/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.admisiones.webui;

import java.awt.event.KeyEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author juan-david
 */
public class Admisiones extends javax.swing.JFrame {
    
    Statement ejecutor = null;
    ResultSet rs;
    String query;
    
    protected void cargarDatos(){
        query = "SELECT * FROM vista_admisiones limit 1;";
        
        try {
            ejecutor = con.createStatement();
            ejecutor.setQueryTimeout(20);
            rs = ejecutor.executeQuery(query);
            while (rs.next() == true) {
                String qanno = rs.getString("anno_convocatoria");
                String qsemestre = rs.getString("semestre_convocatoria");
                String qfecha = rs.getString("fecha_prueba_admision");
                String qsede =rs.getString("nombre_sede");
                String qfacultad =rs.getString("nombre_facultad");
                String qprograma =rs.getString("nombre_programa");
                semestre.setText(qanno + " - " + qsemestre);
                texto_semestre2.setText(qanno + " - " + qsemestre);
                texto_sede2.setText(qsede);
                programa.setText(qfacultad + " - "+ qprograma);
                texto_programa2.setText(qfacultad + " - "+ qprograma);
            }
        } catch (Exception e){
            JOptionPane.showMessageDialog(null, "Error" + e);
        }
        query = "SELECT * FROM vista_aspirante_noeditable limit 1;";
        try {
            ejecutor = con.createStatement();
            ejecutor.setQueryTimeout(20);
            rs = ejecutor.executeQuery(query);
            while (rs.next() == true) { 
                String qnombre = rs.getString("nombre_aspirante");
                String qapellido = rs.getString("apellido_aspirante");
                String qcorreo = rs.getString("correo_personal_aspirante");
                String qtelefono =rs.getString("telefono_aspirante");
                nombre.setText(qnombre);
                apellido.setText(qapellido);
                correo.setText(qcorreo);
                telefono.setText(qtelefono.toString());
            }
        } catch (Exception e){
            JOptionPane.showMessageDialog(null, "Error" + e);
        }
    }
    
    protected void cargarDatosPrueba(){
        query = "SELECT * FROM VistaPruebasAdmision limit 1;";
        try {
            ejecutor = con.createStatement();
            ejecutor.setQueryTimeout(20);
            rs = ejecutor.executeQuery(query);
            while (rs.next() == true) {
                String pfecha = rs.getString("fecha_prueba_admision");
                String presultado = rs.getString("Resultado_prueba_pregrado");
                String padmitido = rs.getString("Admitido");
                String plugar =rs.getString("nombre_lugar_prueba");
                String pdepartamento =rs.getString("departamento_lugar_prueba");
                String pcuidad=rs.getString("ciudad_lugar_prueba");
                String pdescripcion =rs.getString("descripcion_especifica_lugar_prueba");
                texto_fecha.setText(pfecha);
                texto_lugar.setText(plugar);
                texto_departamento.setText(pdepartamento);
                texto_cuidad.setText(pcuidad);
                texto_esp_lugar.setText(pdescripcion);
                texto_resultado_examen2.setText(presultado);
                texto_estado2.setText(padmitido);
            }
        } catch (Exception e){
            JOptionPane.showMessageDialog(null, "Error" + e);
        }
    }
    
    Connection con;
    String driver = "com.mysql.cj.jdbc.Driver";
    
    //CAMBIAR
    String user = "";
    String pass = "";
    String url="jdbc:mysql://localhost:3306/bd_admisiones?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    
    public void conectar() {
        con = null;
        try {
            user = usuario.getText();
            pass = contrasenna.getText();
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(url,user,pass);
            if (con != null){
                //estadoCon.setText("Conexión exitosa");
                System.out.println("Conexrión realizada con datos: "+user+" "+pass);
                paneles.setSelectedComponent(menuaspirante);
                cargarDatos();
            }
        } catch (Exception e) {
            //estadoCon.setText("Conexión no exitosa "+e);
            JOptionPane.showMessageDialog(null, "Error" + e);
        }
    }
    
    public void getdata() {
        
    }
    
    /**
     * Creates new form Ingreso
     */
    public Admisiones() {
        initComponents();
        boton_guardar.setVisible(false);
        //paneles.setVisible(false);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        paneles = new javax.swing.JTabbedPane();
        Ingreso = new javax.swing.JPanel();
        usuario = new javax.swing.JTextField();
        enunciado_usuario = new javax.swing.JLabel();
        enunciado_contrasenna = new javax.swing.JLabel();
        ingresar = new javax.swing.JButton();
        bannerizquierdo = new javax.swing.JLabel();
        logouniversidad = new javax.swing.JLabel();
        contrasenna = new javax.swing.JPasswordField();
        menuaspirante = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        semestre = new javax.swing.JTextField();
        apellido = new javax.swing.JTextField();
        correo = new javax.swing.JTextField();
        telefono = new javax.swing.JTextField();
        nombre = new javax.swing.JTextField();
        programa = new javax.swing.JTextField();
        boton_guardar = new javax.swing.JButton();
        boton_modificardatos = new javax.swing.JToggleButton();
        jLabel9 = new javax.swing.JLabel();
        boton_resultado = new javax.swing.JButton();
        boton_citacion = new javax.swing.JButton();
        consultaprueba = new javax.swing.JPanel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        boton_atras_1 = new javax.swing.JButton();
        texto_departamento = new javax.swing.JLabel();
        texto_cuidad = new javax.swing.JLabel();
        texto_lugar = new javax.swing.JLabel();
        texto_esp_lugar = new javax.swing.JLabel();
        texto_fecha = new javax.swing.JLabel();
        consultarresultado = new javax.swing.JPanel();
        jLabel15 = new javax.swing.JLabel();
        jLabel16 = new javax.swing.JLabel();
        jLabel17 = new javax.swing.JLabel();
        jLabel18 = new javax.swing.JLabel();
        jLabel19 = new javax.swing.JLabel();
        jLabel20 = new javax.swing.JLabel();
        jLabel21 = new javax.swing.JLabel();
        texto_semestre2 = new javax.swing.JLabel();
        texto_sede2 = new javax.swing.JLabel();
        texto_programa2 = new javax.swing.JLabel();
        texto_estado2 = new javax.swing.JLabel();
        texto_resultado_examen2 = new javax.swing.JLabel();
        boton_atras_2 = new javax.swing.JButton();
        Ocultar = new javax.swing.JPanel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(255, 255, 255));

        Ingreso.setBackground(new java.awt.Color(255, 255, 255));

        usuario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                usuarioActionPerformed(evt);
            }
        });
        usuario.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                usuarioKeyPressed(evt);
            }
        });

        enunciado_usuario.setText("Usuario:");

        enunciado_contrasenna.setText("Contraseña:");

        ingresar.setText("Ingresar");
        ingresar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        ingresar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ingresarActionPerformed(evt);
            }
        });

        bannerizquierdo.setIcon(new javax.swing.ImageIcon("/home/juan-david/NetBeansProjects/Admisiones/src/main/java/com/admisiones/imagenes/bannerizquierdo.jpg")); // NOI18N

        logouniversidad.setIcon(new javax.swing.ImageIcon("/home/juan-david/NetBeansProjects/Admisiones/src/main/java/com/admisiones/imagenes/logouniversidad2.png")); // NOI18N

        contrasenna.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                contrasennaActionPerformed(evt);
            }
        });
        contrasenna.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                contrasennaKeyPressed(evt);
            }
        });

        javax.swing.GroupLayout IngresoLayout = new javax.swing.GroupLayout(Ingreso);
        Ingreso.setLayout(IngresoLayout);
        IngresoLayout.setHorizontalGroup(
            IngresoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(IngresoLayout.createSequentialGroup()
                .addComponent(bannerizquierdo, javax.swing.GroupLayout.PREFERRED_SIZE, 372, Short.MAX_VALUE)
                .addGap(75, 75, 75)
                .addGroup(IngresoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(enunciado_usuario)
                    .addComponent(enunciado_contrasenna)
                    .addComponent(usuario)
                    .addComponent(ingresar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(logouniversidad, javax.swing.GroupLayout.DEFAULT_SIZE, 238, Short.MAX_VALUE)
                    .addComponent(contrasenna))
                .addGap(155, 155, 155))
        );
        IngresoLayout.setVerticalGroup(
            IngresoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(bannerizquierdo, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
            .addGroup(IngresoLayout.createSequentialGroup()
                .addGap(112, 112, 112)
                .addComponent(logouniversidad)
                .addGap(18, 18, 18)
                .addComponent(enunciado_usuario)
                .addGap(6, 6, 6)
                .addComponent(usuario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(12, 12, 12)
                .addComponent(enunciado_contrasenna)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(contrasenna, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(ingresar)
                .addContainerGap(172, Short.MAX_VALUE))
        );

        paneles.addTab("tab1", Ingreso);

        menuaspirante.setBackground(new java.awt.Color(255, 255, 255));

        jLabel1.setIcon(new javax.swing.ImageIcon("/home/juan-david/NetBeansProjects/Admisiones/src/main/java/com/admisiones/imagenes/logouniversidad_50px.png.jpg")); // NOI18N
        jLabel1.setText("→ Usuario");

        jLabel2.setFont(new java.awt.Font("Liberation Sans", 1, 24)); // NOI18N
        jLabel2.setText("Aspirante");

        jLabel3.setFont(new java.awt.Font("Liberation Sans", 1, 18)); // NOI18N
        jLabel3.setText("Nombre:");

        jLabel4.setFont(new java.awt.Font("Liberation Sans", 1, 18)); // NOI18N
        jLabel4.setText("Apellido:");

        jLabel5.setFont(new java.awt.Font("Liberation Sans", 1, 18)); // NOI18N
        jLabel5.setText("Correo Electronico:");

        jLabel6.setFont(new java.awt.Font("Liberation Sans", 1, 18)); // NOI18N
        jLabel6.setText("Número de teléfono:");

        jLabel7.setFont(new java.awt.Font("Liberation Sans", 1, 18)); // NOI18N
        jLabel7.setText("Semestre convocatoria:");

        jLabel8.setFont(new java.awt.Font("Liberation Sans", 1, 18)); // NOI18N
        jLabel8.setText("Programa seleccionado:");

        semestre.setText("Default");
        semestre.setEnabled(false);
        semestre.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                semestreActionPerformed(evt);
            }
        });

        apellido.setText("Default");
        apellido.setEnabled(false);
        apellido.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                apellidoActionPerformed(evt);
            }
        });

        correo.setText("Default");
        correo.setEnabled(false);

        telefono.setText("Default");
        telefono.setEnabled(false);

        nombre.setText("Default");
        nombre.setEnabled(false);

        programa.setText("Default");
        programa.setEnabled(false);

        boton_guardar.setText("Guardar");
        boton_guardar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        boton_guardar.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            public void mouseDragged(java.awt.event.MouseEvent evt) {
                boton_guardarMouseDragged(evt);
            }
        });
        boton_guardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                boton_guardarActionPerformed(evt);
            }
        });

        boton_modificardatos.setText("Modificar datos");
        boton_modificardatos.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        boton_modificardatos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                boton_modificardatosActionPerformed(evt);
            }
        });

        jLabel9.setFont(new java.awt.Font("Liberation Sans", 1, 24)); // NOI18N
        jLabel9.setText("Consultar examen de admisión");

        boton_resultado.setText("Consultar resultado examen");
        boton_resultado.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        boton_resultado.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                boton_resultadoActionPerformed(evt);
            }
        });

        boton_citacion.setText("Consultar citacion examen");
        boton_citacion.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        boton_citacion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                boton_citacionActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout menuaspiranteLayout = new javax.swing.GroupLayout(menuaspirante);
        menuaspirante.setLayout(menuaspiranteLayout);
        menuaspiranteLayout.setHorizontalGroup(
            menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(menuaspiranteLayout.createSequentialGroup()
                .addGroup(menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(menuaspiranteLayout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabel1))
                    .addGroup(menuaspiranteLayout.createSequentialGroup()
                        .addGap(142, 142, 142)
                        .addComponent(boton_modificardatos)
                        .addGap(51, 51, 51)
                        .addComponent(boton_guardar)))
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(menuaspiranteLayout.createSequentialGroup()
                .addGap(40, 40, 40)
                .addGroup(menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(menuaspiranteLayout.createSequentialGroup()
                        .addGroup(menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(menuaspiranteLayout.createSequentialGroup()
                                .addComponent(jLabel3)
                                .addGap(20, 20, 20)
                                .addComponent(nombre))
                            .addGroup(menuaspiranteLayout.createSequentialGroup()
                                .addComponent(jLabel4)
                                .addGap(18, 18, 18)
                                .addComponent(apellido)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel8)
                            .addComponent(jLabel7))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(semestre)
                            .addComponent(programa))
                        .addGap(19, 19, 19))
                    .addGroup(menuaspiranteLayout.createSequentialGroup()
                        .addGroup(menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addGroup(menuaspiranteLayout.createSequentialGroup()
                                .addComponent(jLabel5)
                                .addGap(31, 31, 31)
                                .addComponent(correo, javax.swing.GroupLayout.DEFAULT_SIZE, 237, Short.MAX_VALUE))
                            .addGroup(menuaspiranteLayout.createSequentialGroup()
                                .addComponent(jLabel6)
                                .addGap(21, 21, 21)
                                .addComponent(telefono)))
                        .addContainerGap(361, Short.MAX_VALUE))
                    .addGroup(menuaspiranteLayout.createSequentialGroup()
                        .addComponent(jLabel9)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(menuaspiranteLayout.createSequentialGroup()
                        .addGroup(menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(boton_citacion, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(boton_resultado, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );
        menuaspiranteLayout.setVerticalGroup(
            menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(menuaspiranteLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(telefono, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(menuaspiranteLayout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(37, 37, 37)
                        .addComponent(jLabel2)
                        .addGap(26, 26, 26)
                        .addGroup(menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel3)
                            .addComponent(jLabel7)
                            .addComponent(semestre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(nombre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel4)
                            .addComponent(jLabel8)
                            .addComponent(apellido, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(programa, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel5)
                            .addComponent(correo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addComponent(jLabel6)))
                .addGap(18, 18, 18)
                .addGroup(menuaspiranteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(boton_guardar)
                    .addComponent(boton_modificardatos))
                .addGap(18, 18, 18)
                .addComponent(jLabel9)
                .addGap(31, 31, 31)
                .addComponent(boton_resultado)
                .addGap(31, 31, 31)
                .addComponent(boton_citacion)
                .addContainerGap(90, Short.MAX_VALUE))
        );

        paneles.addTab("tab2", menuaspirante);

        consultaprueba.setBackground(new java.awt.Color(255, 255, 255));

        jLabel10.setFont(new java.awt.Font("Liberation Sans", 1, 18)); // NOI18N
        jLabel10.setText("Usted tiene el examen de admisión en:");

        jLabel11.setFont(new java.awt.Font("Liberation Sans", 1, 15)); // NOI18N
        jLabel11.setText("Departamento:");

        jLabel12.setFont(new java.awt.Font("Liberation Sans", 1, 15)); // NOI18N
        jLabel12.setText("Cuidad:");

        jLabel13.setFont(new java.awt.Font("Liberation Sans", 1, 15)); // NOI18N
        jLabel13.setText("Lugar:");

        jLabel14.setFont(new java.awt.Font("Liberation Sans", 1, 15)); // NOI18N
        jLabel14.setText("Fecha:");

        boton_atras_1.setText("Ir atras");
        boton_atras_1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                boton_atras_1ActionPerformed(evt);
            }
        });

        texto_departamento.setText("jLabel15");

        texto_cuidad.setText("jLabel16");

        texto_lugar.setText("jLabel17");

        texto_esp_lugar.setText("jLabel18");

        texto_fecha.setText("jLabel19");

        javax.swing.GroupLayout consultapruebaLayout = new javax.swing.GroupLayout(consultaprueba);
        consultaprueba.setLayout(consultapruebaLayout);
        consultapruebaLayout.setHorizontalGroup(
            consultapruebaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(consultapruebaLayout.createSequentialGroup()
                .addGroup(consultapruebaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(consultapruebaLayout.createSequentialGroup()
                        .addGap(55, 55, 55)
                        .addGroup(consultapruebaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(consultapruebaLayout.createSequentialGroup()
                                .addComponent(jLabel14)
                                .addGap(18, 18, 18)
                                .addComponent(texto_fecha))
                            .addGroup(consultapruebaLayout.createSequentialGroup()
                                .addComponent(jLabel12)
                                .addGap(18, 18, 18)
                                .addComponent(texto_cuidad))
                            .addGroup(consultapruebaLayout.createSequentialGroup()
                                .addComponent(jLabel11)
                                .addGap(18, 18, 18)
                                .addComponent(texto_departamento))
                            .addComponent(jLabel10)
                            .addGroup(consultapruebaLayout.createSequentialGroup()
                                .addComponent(jLabel13)
                                .addGap(18, 18, 18)
                                .addGroup(consultapruebaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(texto_esp_lugar)
                                    .addComponent(texto_lugar)))))
                    .addGroup(consultapruebaLayout.createSequentialGroup()
                        .addGap(67, 67, 67)
                        .addComponent(boton_atras_1)))
                .addContainerGap(442, Short.MAX_VALUE))
        );
        consultapruebaLayout.setVerticalGroup(
            consultapruebaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(consultapruebaLayout.createSequentialGroup()
                .addGap(36, 36, 36)
                .addComponent(jLabel10)
                .addGap(27, 27, 27)
                .addGroup(consultapruebaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel11)
                    .addComponent(texto_departamento))
                .addGap(30, 30, 30)
                .addGroup(consultapruebaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel12)
                    .addComponent(texto_cuidad))
                .addGap(31, 31, 31)
                .addGroup(consultapruebaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel13)
                    .addComponent(texto_lugar))
                .addGap(18, 18, 18)
                .addComponent(texto_esp_lugar)
                .addGap(39, 39, 39)
                .addGroup(consultapruebaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel14)
                    .addComponent(texto_fecha))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 205, Short.MAX_VALUE)
                .addComponent(boton_atras_1)
                .addGap(61, 61, 61))
        );

        paneles.addTab("tab3", consultaprueba);

        consultarresultado.setBackground(new java.awt.Color(255, 255, 255));

        jLabel16.setBackground(new java.awt.Color(255, 255, 255));
        jLabel16.setFont(new java.awt.Font("Liberation Sans", 1, 18)); // NOI18N
        jLabel16.setText("Resultados de su último examen de admisión:");

        jLabel17.setFont(new java.awt.Font("Liberation Sans", 1, 15)); // NOI18N
        jLabel17.setText("Semestre: ");

        jLabel18.setFont(new java.awt.Font("Liberation Sans", 1, 15)); // NOI18N
        jLabel18.setText("Sede: ");

        jLabel19.setFont(new java.awt.Font("Liberation Sans", 1, 15)); // NOI18N
        jLabel19.setText("Programa: ");

        jLabel20.setFont(new java.awt.Font("Liberation Sans", 1, 15)); // NOI18N
        jLabel20.setText("Estado: ");

        jLabel21.setFont(new java.awt.Font("Liberation Sans", 1, 15)); // NOI18N
        jLabel21.setText("Resultado examen: ");

        texto_semestre2.setText("jLabel22");

        texto_sede2.setText("jLabel22");

        texto_programa2.setText("jLabel22");

        texto_estado2.setText("jLabel22");

        texto_resultado_examen2.setText("jLabel22");

        boton_atras_2.setText("Ir atras");
        boton_atras_2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                boton_atras_2ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout consultarresultadoLayout = new javax.swing.GroupLayout(consultarresultado);
        consultarresultado.setLayout(consultarresultadoLayout);
        consultarresultadoLayout.setHorizontalGroup(
            consultarresultadoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(consultarresultadoLayout.createSequentialGroup()
                .addGap(66, 66, 66)
                .addGroup(consultarresultadoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(boton_atras_2)
                    .addGroup(consultarresultadoLayout.createSequentialGroup()
                        .addComponent(jLabel18)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(consultarresultadoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel15)
                            .addComponent(texto_sede2)))
                    .addGroup(consultarresultadoLayout.createSequentialGroup()
                        .addComponent(jLabel17)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(texto_semestre2))
                    .addComponent(jLabel16)
                    .addGroup(consultarresultadoLayout.createSequentialGroup()
                        .addComponent(jLabel19)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(texto_programa2))
                    .addGroup(consultarresultadoLayout.createSequentialGroup()
                        .addComponent(jLabel21)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(texto_resultado_examen2))
                    .addGroup(consultarresultadoLayout.createSequentialGroup()
                        .addComponent(jLabel20)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(texto_estado2)))
                .addContainerGap(368, Short.MAX_VALUE))
        );
        consultarresultadoLayout.setVerticalGroup(
            consultarresultadoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(consultarresultadoLayout.createSequentialGroup()
                .addGap(70, 70, 70)
                .addComponent(jLabel16)
                .addGap(39, 39, 39)
                .addGroup(consultarresultadoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel17)
                    .addComponent(texto_semestre2))
                .addGap(34, 34, 34)
                .addGroup(consultarresultadoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel18)
                    .addComponent(texto_sede2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel15)
                .addGap(28, 28, 28)
                .addGroup(consultarresultadoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel19)
                    .addComponent(texto_programa2))
                .addGap(35, 35, 35)
                .addGroup(consultarresultadoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel21)
                    .addComponent(texto_resultado_examen2))
                .addGap(36, 36, 36)
                .addGroup(consultarresultadoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel20)
                    .addComponent(texto_estado2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 139, Short.MAX_VALUE)
                .addComponent(boton_atras_2)
                .addGap(60, 60, 60))
        );

        paneles.addTab("tab4", consultarresultado);

        javax.swing.GroupLayout OcultarLayout = new javax.swing.GroupLayout(Ocultar);
        Ocultar.setLayout(OcultarLayout);
        OcultarLayout.setHorizontalGroup(
            OcultarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 828, Short.MAX_VALUE)
        );
        OcultarLayout.setVerticalGroup(
            OcultarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 34, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(paneles)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                    .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Ocultar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(paneles)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addComponent(Ocultar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 580, Short.MAX_VALUE)))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void ingresarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ingresarActionPerformed
        conectar();
    }//GEN-LAST:event_ingresarActionPerformed

    private void usuarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_usuarioActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_usuarioActionPerformed

    private void apellidoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_apellidoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_apellidoActionPerformed

    private void semestreActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_semestreActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_semestreActionPerformed

    private void contrasennaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_contrasennaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_contrasennaActionPerformed

    private void boton_guardarMouseDragged(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_boton_guardarMouseDragged
        // TODO add your handling code here:
    }//GEN-LAST:event_boton_guardarMouseDragged

    private void boton_guardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_boton_guardarActionPerformed
        PreparedStatement preparar = null;
        String query = "UPDATE vista_aspirante_editable SET correo_personal_aspirante = '"+correo.getText()+"', telefono_aspirante = '"+telefono.getText()+"';";
        try {
            preparar = con.prepareStatement(query);
            preparar.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error" + e);
        }
    }//GEN-LAST:event_boton_guardarActionPerformed

    private void boton_resultadoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_boton_resultadoActionPerformed
        paneles.setSelectedComponent(consultarresultado);
        cargarDatosPrueba();
    }//GEN-LAST:event_boton_resultadoActionPerformed

    private void contrasennaKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_contrasennaKeyPressed
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            conectar();
        }
    }//GEN-LAST:event_contrasennaKeyPressed

    private void usuarioKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_usuarioKeyPressed
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            conectar();
        }
    }//GEN-LAST:event_usuarioKeyPressed

    private void boton_modificardatosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_boton_modificardatosActionPerformed
        if (boton_modificardatos.isSelected()){
            //nombre.setEnabled(true);
            //apellido.setEnabled(true);
            telefono.setEnabled(true);
            correo.setEnabled(true);
            //semestre.setEnabled(true);
            //programa.setEnabled(true);
            boton_guardar.setVisible(true);
            cargarDatos();
        }else{
            nombre.setEnabled(false);
            apellido.setEnabled(false);
            telefono.setEnabled(false);
            correo.setEnabled(false);
            //semestre.setEnabled(true);
            //programa.setEnabled(true);
            boton_guardar.setVisible(false);
            cargarDatos();
        }
    }//GEN-LAST:event_boton_modificardatosActionPerformed

    private void boton_atras_1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_boton_atras_1ActionPerformed
        paneles.setSelectedComponent(menuaspirante);
    }//GEN-LAST:event_boton_atras_1ActionPerformed

    private void boton_citacionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_boton_citacionActionPerformed
        paneles.setSelectedComponent(consultaprueba);
        cargarDatosPrueba();
    }//GEN-LAST:event_boton_citacionActionPerformed

    private void boton_atras_2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_boton_atras_2ActionPerformed
        paneles.setSelectedComponent(menuaspirante);
    }//GEN-LAST:event_boton_atras_2ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Admisiones.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Admisiones.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Admisiones.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Admisiones.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Admisiones().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel Ingreso;
    private javax.swing.JPanel Ocultar;
    private javax.swing.JTextField apellido;
    private javax.swing.JLabel bannerizquierdo;
    private javax.swing.JButton boton_atras_1;
    private javax.swing.JButton boton_atras_2;
    private javax.swing.JButton boton_citacion;
    private javax.swing.JButton boton_guardar;
    private javax.swing.JToggleButton boton_modificardatos;
    private javax.swing.JButton boton_resultado;
    private javax.swing.JPanel consultaprueba;
    private javax.swing.JPanel consultarresultado;
    private javax.swing.JPasswordField contrasenna;
    private javax.swing.JTextField correo;
    private javax.swing.JLabel enunciado_contrasenna;
    private javax.swing.JLabel enunciado_usuario;
    private javax.swing.JButton ingresar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel18;
    private javax.swing.JLabel jLabel19;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JLabel logouniversidad;
    private javax.swing.JPanel menuaspirante;
    private javax.swing.JTextField nombre;
    private javax.swing.JTabbedPane paneles;
    private javax.swing.JTextField programa;
    private javax.swing.JTextField semestre;
    private javax.swing.JTextField telefono;
    private javax.swing.JLabel texto_cuidad;
    private javax.swing.JLabel texto_departamento;
    private javax.swing.JLabel texto_esp_lugar;
    private javax.swing.JLabel texto_estado2;
    private javax.swing.JLabel texto_fecha;
    private javax.swing.JLabel texto_lugar;
    private javax.swing.JLabel texto_programa2;
    private javax.swing.JLabel texto_resultado_examen2;
    private javax.swing.JLabel texto_sede2;
    private javax.swing.JLabel texto_semestre2;
    private javax.swing.JTextField usuario;
    // End of variables declaration//GEN-END:variables
}
