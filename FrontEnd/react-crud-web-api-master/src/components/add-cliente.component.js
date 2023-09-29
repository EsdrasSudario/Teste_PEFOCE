import React, { Component } from "react";
import ClienteDataService from "../services/cliente.service";
import { Link } from "react-router-dom";
import { withRouter } from '../common/with-router';

class AddCliente extends Component {
constructor(props) {
 super(props);
  this.salvarCliente = this.salvarCliente.bind(this);
  this.novoCliente = this.novoCliente.bind(this);
  this.validaNome = this.validaNome.bind(this);
  this.validaEmail = this.validaEmail.bind(this);
  this.validaCPF = this.validaCPF.bind(this);
  this.validaRenda = this.validaRenda.bind(this);
  this.validaTelefone = this.validaTelefone.bind(this);
  this.validaData = this.validaData.bind(this);
  this.telaClientes = this.telaClientes.bind(this);
  this.state = {
    id: null,
    nome: "",
    email: "", 
    cpf: "",
    renda: null,
    telefone: "",
    data_criacao: "",
    submitted: false
  };
}

validaNome(e){
  var valido = e.target.validity.valid;
  if(valido){
    this.setState({
      nome: e.target.value
    });
    document.getElementById("labelnome").innerHTML="<font color='gren' id='nomeValido'>Nome válido </font>";
  } else {
    document.getElementById("nome").focus();
    document.getElementById("labelnome").innerHTML="<font color='red'>Nome inválido </font>";
  }
}

validaEmail(e){
  var valor = e.target.value;
  var usuario = valor.substring(0, valor.indexOf("@"));
  var dominio = valor.substring(valor.indexOf("@") + 1, valor.length);
  
  if((usuario.length >=1) &&
     (dominio.length >=3) &&
     (usuario.search("@")===-1) &&
     (dominio.search("@")===-1) &&
     (usuario.search(" ")===-1) &&
     (dominio.search(" ")===-1) &&
     (dominio.search(".")!==-1) &&
     (dominio.indexOf(".") >=1)&&
     (dominio.lastIndexOf(".") < dominio.length - 1)
  ) {
    this.setState({
      email: e.target.value
    });
    document.getElementById("labelmail").innerHTML="<font color='gren' id='emailValido'>E-mail válido </font>";
    } else{
      document.getElementById("email").focus();
      document.getElementById("labelmail").innerHTML="<font color='red'>E-mail inválido </font>";
      }
}

validaCPF(e){
  var valido = e.target.validity.valid;
  if(valido){
    var elementoCpf = e;
    var cpfAtual = e.target.value;
    var cpfAtualizado;
    cpfAtualizado = cpfAtual.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, function( _regex, argumento1, argumento2, argumento3, argumento4 ) {return argumento1 + '.' + argumento2 + '.' + argumento3 + '-' + argumento4;});
    elementoCpf.target.value = cpfAtualizado;
    this.setState({
      cpf: cpfAtual
    });
    document.getElementById("labelcpf").innerHTML="<font color='gren' id='cpfValido'>CPF válido </font>";
  }else{
    document.getElementById("cpf").focus();
    document.getElementById("labelcpf").innerHTML="<font color='red'>CPF inválido </font>";
  }
}

validaRenda(e){
  var valido = e.target.validity.valid;
  if(valido){
    var rendaAtual = e.target.value;
    e.target.value = parseFloat(rendaAtual).toLocaleString('pt-br',{style: 'currency', currency: 'BRL'});
    this.setState({
    renda: rendaAtual
    });
    document.getElementById("labelrenda").innerHTML="<font color='gren' id='rendaValido'>Renda válido </font>";
  }else{
    document.getElementById("renda").focus();
    document.getElementById("labelrenda").innerHTML="<font color='red'>Renda inválido </font>";
  }
}

validaTelefone(e){
  var valor = e.target.value
  if(valor.length === 15 || valor === ""){
    for (let index = 0; index < 4; index++) {
      valor = valor.replace(/[()\s-]/,'');//Esse replace troca os () e os - por espaço
    }
    this.setState({
      telefone: valor
      });
    document.getElementById("labeltelefone").innerHTML="<font color='gren' id='telefoneValido'>Telefone válido </font>";
  }else{
    document.getElementById("telefone").focus();
    document.getElementById("labeltelefone").innerHTML="<font color='red'>Telefone inválido </font>";
  }
}

handlePhone = (e) => {
  e.target.value = this.phoneMask(e.target.value);
}

phoneMask = (value) => {
  if (!value) return ""
  value = value.replace(/\D/g,'')
  value = value.replace(/(\d{2})(\d)/,"($1) $2")
  value = value.replace(/(\d)(\d{4})$/,"$1-$2")
  return value
}

validaData(e){
  const corrente = new Date();
  const criacao = new Date(e.target.value);
  if((criacao.getDate() >= corrente.getDate()) && (criacao.getHours() <= corrente.getHours())){
    this.setState({
      data_criacao: e.target.value
    });
    document.getElementById("labeldata").innerHTML="<font color='gren' id='dadaValido'>Data de Criação válido </font>";
  }else{
    document.getElementById("data").focus();
    document.getElementById("labeldata").innerHTML="<font color='red'>Data de Criação inválido </font>";
  }
}

salvarCliente() {
  const labelnome = document.getElementById("nomeValido").innerHTML;
  const labelmail = document.getElementById("emailValido").innerHTML;
  const labelcpf = document.getElementById("cpfValido").innerHTML;
  const labelrenda = document.getElementById("rendaValido").innerHTML;
  const labeltelefone = document.getElementById("telefoneValido").innerHTML;
  const labeldata = document.getElementById("dadaValido").innerHTML;
  if(labelnome === "Nome válido " &&
     labelmail === "E-mail válido " &&
     labelcpf === "CPF válido " &&
     labelrenda === "Renda válido " &&
     labeltelefone === "Telefone válido " &&
     labeldata === "Data de Criação válido "
    )
  {
    var data = {
      nome: this.state.nome,
      email: this.state.email,
      cpf: this.state.cpf,
      renda: this.state.renda,
      telefone: this.state.telefone,
      data_criacao: this.state.data_criacao
    };
    ClienteDataService.create(data)
      .then(response => {
        this.setState({
          id: response.data.id,
          nome: response.data.nome,
          email: response.data.email, 
          cpf: response.data.cpf,
          renda: response.data.renda,
          telefone: response.data.telefone,
          data_criacao: response.data.data_criacao,
          submitted: true
        });
        console.log(response.data);
      })
      .catch(e => {
        console.log(e);
      });
  }else{
    console.log("Preencher os campos corretamente")
  }
}

novoCliente() {
  this.setState({
    id: null,
    nome: "",
    email: "",
    cpf: "",
    renda: null,
    telefone: "",
    data_criacao: "",
    submitted: false
  });
}

telaClientes(){
  this.props.router.navigate('/clientes');
}

render() {
  return (
      <div className="submit-form">
        {this.state.submitted ? (
          <div>
            <h4>Cadastro feito com sucesso!</h4>
            <button className="btn btn-success" onClick={this.novoCliente}>
              Novo Cadastro
            </button>
            <div>
              <br/>
              <button className="btn btn-info" onClick={this.telaClientes}>
                Tela de Clientes
              </button>
            </div>
          </div>
        ) : (
          <div>
            <h4>
              Tela de Cadastro de Cliente
            </h4>
            <div className="form-group">
              <label htmlFor="nome" id="labelnome">Nome</label>
              <input
                type="text"
                className="form-control"
                id="nome"
                name="nome"
                minLength={2}
                required
                autoFocus
                placeholder="Exemplo: Jó Braz"
                onBlur={this.validaNome} />
            </div>

            <div className="form-group">
              <label htmlFor="email" id="labelmail">E-mail</label>
              <input
                type="email"
                className="form-control"
                id="email"
                name="email"
                autoComplete="true"
                placeholder="Exemplo: usuario@dominio.com"
                required
                onBlur={this.validaEmail} />
            </div>

            <div className="form-group">
              <label htmlFor="cpf" id="labelcpf">CPF</label>
              <input
                type="text"
                maxLength={11}
                className="form-control"
                id="cpf"
                name="cpf"
                pattern="[0-9]{11}"
                placeholder="Coloque só números, exemplo: 47133183293"
                required
                onBlur={this.validaCPF} />
            </div>

            <div className="form-group">
              <label htmlFor="renda" id="labelrenda">Renda</label>
              <input
                type="text"
                className="form-control"
                id="renda"
                name="renda"
                maxLength={9}
                pattern="([^\s\D][0-9\.]{0,6})\.*([0-9]{0,2})"
                placeholder="Coloque primeiro o valor inteiro, depois os centavos separado por '.' , exemplo: 1250.75"
                required
                onBlur={this.validaRenda} />
            </div>

            <div className="form-group">
              <label htmlFor="telefone" id="labeltelefone">Telefone</label>
              <input
                type="text"
                className="form-control"
                id="telefone"
                name="telefone"
                placeholder="Coloque só o DDD e o número do telefone, sem -, . e () "
                maxLength={15}
                onKeyUp={this.handlePhone}
                onBlur={this.validaTelefone} />
            </div>

            <div className="form-group">
              <label htmlFor="data" id="labeldata">Data de Criação</label>
              <input
                type="DateTime-Local"
                className="form-control"
                id="data"
                name="data"
                required
                onChange={this.validaData} />
            </div>

            <center>
              <br/>
              <button onClick={this.salvarCliente} className="btn btn-success" id="btnCadastrar">
                Cadastrar
              </button>
              <font color='white'>espaço</font>
              <Link
                to={"/clientes/"}
                className="btn btn-info">
                Tela clientes
              </Link>
            </center>
          </div>
        )}
      </div>
  );
}
}

export default withRouter(AddCliente);