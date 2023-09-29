import React, { Component } from "react";
import ClienteDataService from "../services/cliente.service";
import { Link } from "react-router-dom";
import { withRouter } from '../common/with-router';

class ClientesList extends Component {
  constructor(props) {
    super(props);
    this.retrieveClientes = this.retrieveClientes.bind(this);
    this.refreshList = this.refreshList.bind(this);
    this.setActiveCliente = this.setActiveCliente.bind(this);
    this.removeAllClientes = this.removeAllClientes.bind(this);
    this.adicionarCliente = this.adicionarCliente.bind(this);

    this.state = {
      clientes: [],
      currentCliente: null,
      currentIndex: -1,
    };
  }

  componentDidMount() {
    this.retrieveClientes();
  }

  retrieveClientes() {
    ClienteDataService.getAll()
      .then(response => {
        this.setState({
          clientes: response.data
        });
        console.log(response.data);
      })
      .catch(e => {
        console.log(e);
      });
  }

  refreshList() {
    this.retrieveClientes();
    this.setState({
      currentCliente: null,
      currentIndex: -1
    });
  }

  setActiveCliente(tutorial, index) {
    this.setState({
      currentCliente: tutorial,
      currentIndex: index
    });
  }

  removeAllClientes() {
    ClienteDataService.deleteAll()
      .then(response => {
        console.log(response.data);
        this.refreshList();
      })
      .catch(e => {
        console.log(e);
      });
  }

  adicionarCliente() {
    this.props.router.navigate('/add');
  }

  render() {
    const { clientes, currentCliente, currentIndex } = this.state;
    //var format = currentCliente.data_criacao;
    //for (let index = 0; index < 4; index++) {
      //format = format.replace(/[-T:]/,'');//Esse replace tira os - o T e os :
    //}

    return (
      <div className="list row">
        <div className="col-md-8">
        </div>
        <div className="col-md-6">
          <h4>Lista de Clientes</h4>
          <ul className="list-group">
            {clientes &&
              clientes.map((tutorial, index) => (
                <li
                  className={
                    "list-group-item " +
                    (index === currentIndex ? "active" : "")
                  }
                  onClick={() => this.setActiveCliente(tutorial, index)}
                  key={index}
                >
                  {tutorial.nome}
                </li>
              ))}
          </ul>
          <button
            className="m-3 btn btn-sm btn-success"
            onClick={this.adicionarCliente}
          >
            Adicionar cliente
          </button>
          <button
            className="m-3 btn btn-sm btn-danger"
            onClick={this.removeAllClientes}
          >
            Remover todos
          </button>
        </div>
        <div className="col-md-6">
          {currentCliente ? (
            <div>
              <h4>Cliente</h4>
              <div>
                <label>
                  <strong>Id:</strong>
                </label>{" "}
                {currentCliente.id}
              </div>
              <div>
                <label>
                  <strong>Nome:</strong>
                </label>{" "}
                {currentCliente.nome}
              </div>
              <div>
                <label>
                  <strong>E-mail:</strong>
                </label>{" "}
                {currentCliente.email}
              </div>
              <div>
                <label>
                  <strong>CPF:</strong>
                </label>{" "}
                {currentCliente.cpf.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, function( _regex, argumento1, argumento2, argumento3, argumento4 ) {return argumento1 + '.' + argumento2 + '.' + argumento3 + '-' + argumento4;})}
              </div>
              <div>
                <label>
                  <strong>Renda:</strong>
                </label>{" "}
                {parseFloat(currentCliente.renda).toLocaleString('pt-br',{style: 'currency', currency: 'BRL'})}
              </div>
              <div>
                <label>
                  <strong>Telefone:</strong>
                </label>{" "}
                {currentCliente.telefone.replace(/(\d{2})(\d{4,5})(\d{4})$/,"($1) $2-$3")}
              </div>
              <div>
                <label>
                  <strong id="teste">Data de Criação:</strong>
                </label>{" "}
                {currentCliente.data_criacao}
              </div>
              <Link
                to={"/clientes/" + currentCliente.id}
                className="badge badge-warning"
              >
                Editar
              </Link>
            </div>
          ) : (
          <div>
            <br />
            <p>Por favor clique em um cliente.</p>
          </div>
          )}
        </div>
      </div>
    );
  }
}

export default withRouter(ClientesList);