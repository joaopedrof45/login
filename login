/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkgnew;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author JoaoPedro
 */
public class login {
    
    private String nome;
    private String senha;
    
    
    
    public void  setnome(String var){
    
    this.nome=var;
  
}
    
    public  String getnome(){
    return nome;
}
    
    public void  setsenha(String var1){
    
    this.senha=var1;
  
}
    
     public String  getsenha(){
    
    return senha;
  
}
     public void Alimentacampo() throws SQLException{
         
         JOptionPane.showMessageDialog(null, "digite seu nome");
         String var=JOptionPane.showInputDialog(nome);
         JOptionPane.showMessageDialog(null, "digite sua senha");
         String var2=JOptionPane.showInputDialog(senha);
          
        VerificarCampo(var, var2); 
     }
     
     public Boolean VerificarCampo(String nome1,String senha1) throws SQLException{
         boolean result = false;
         //abre conexao
        Connection con = ConnectionFactory
        .getConnection();
//prepara a var para colocar comando sql
        PreparedStatement stmt = null ;
        String sql="select nome,senha from user where nome='"+nome1+"'and  senha='"+senha1+"'";	
        stmt= con.prepareStatement(sql);

ResultSet rs = stmt.executeQuery(sql);
        
if (rs != null) { // Verifica se a query retornou algo
    
    while (rs.next()) {
String Nome=rs.getString(1);// pega as variaveis do banco
String Senha=rs.getString(2);

 
    
  }
    
       if(Nome!=null || Senha!=null){//verifica se o que veio do banco é diferente de nulo
        JOptionPane.showMessageDialog(null, "Usuario Cadastrado");
  result = true;
    }else{
        JOptionPane.showMessageDialog(null, "Usuario nao Cadastrado");
    }
    
    }else{
    JOptionPane.showMessageDialog(null, "Erro na pesquisa");
}

         
       
          /* String nomei="admin";
         String senhai="teste";
         
         if(nome.equals(nomei) && senha.equals(senhai)){
             JOptionPane.showMessageDialog(null, "Senha e Nome conferem :D acesso liberado");  
             result = true;  
         }else{
             
             JOptionPane.showMessageDialog(null, "Senha e Nome não conferem:( tente denovo"); 
              result = false;
              this.Alimentacampo();
              
         }*/
        
         return result;
     }
     
     
     
    
    
    
    
    
 
    
    
    
}
    
    
    
    
    

