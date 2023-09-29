import React, { Component } from "react";
import { withRouter } from '../common/with-router';

class LoginCliente extends Component {
    constructor(props) {
        super(props);
        this.logar = this.logar.bind(this);
    
        this.state = {
          message: ""
        };
    }

  logar(){
    var usuario = document.getElementById("usuario").value;
    var senha = document.getElementById("senha").value;
    if((usuario === "admin" && senha === "admin") || (usuario === "comum" && senha === "comum")){
        this.props.router.navigate('/clientes');
      }else{
        alert("Usuário ou senha errado !");
      }
  }
  
  render() {
    return (
      <div className="list row">
        <div className="col-md-6">
          <h4>Tela de Login</h4>
        </div>
        <div>
          <div className="form-group">
              <label htmlFor="usuario">Usuário</label>
              <select
                className="form-control"
                id="usuario"
                name="usuario"
                required
                autoFocus>
                  <option value={"admin"}>
                    Admin
                  </option>
                  <option value={"comum"}>
                    Comum
                  </option>
              </select>
          </div>
          <div className="form-group">
            <label htmlFor="senha">Senha</label>
            <input
              maxLength={5}
              type="password"
              className="form-control"
              id="senha"
              required
              name="senha"/>
          </div>
          <center>
            <br/>
            <button onClick={this.logar} className="btn btn-info">
              Acessar
            </button>
          </center>
        </div>
      </div>
    );
  }
}

export default withRouter(LoginCliente);