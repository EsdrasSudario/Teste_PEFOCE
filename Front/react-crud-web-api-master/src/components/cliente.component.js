import React, { Component } from "react";
import Cliente from "../services/cliente.service";
import { withRouter } from '../common/with-router';

class ClienteTela extends Component {
  constructor(props) {
    super(props);
    this.onChangeNome = this.onChangeNome.bind(this);
    this.onChangeEmail = this.onChangeEmail.bind(this);
    this.onChangeCPF = this.onChangeCPF.bind(this);
    this.onChangeRenda = this.onChangeRenda.bind(this);
    this.onChangeTelefone = this.onChangeTelefone.bind(this);
    this.onChangeData = this.onChangeData.bind(this);
    this.getCliente = this.getCliente.bind(this);
    this.goTelaClientes = this.goTelaClientes.bind(this);
    this.updateCliente = this.updateCliente.bind(this);
    this.deleteCliente = this.deleteCliente.bind(this);

    this.state = {
      currentCliente: {
        id: null,
        nome: "",
        email: "", 
        cpf: "",
        renda: null,
        telefone: "",
        data_criacao: "",
        title: "",
        description: "",
      },
    };
  }

  componentDidMount() {
    this.getCliente(this.props.router.params.id);
  }

  getCliente(id) {
    Cliente.get(id)
      .then(response => {
        this.setState({
          currentCliente: response.data
        });
        console.log(response.data);
      })
      .catch(e => {
        console.log(e);
      });
  }

  onChangeNome(e) {
    const nome = e.target.value;

    this.setState(function(prevState) {
      return {
        currentCliente: {
          ...prevState.currentCliente,
          nome: nome
        }
      };
    });
  }


  onChangeEmail(e) {
    const email = e.target.value;
    
    this.setState(prevState => ({
      currentCliente: {
        ...prevState.currentCliente,
        email: email
      }
    }));
  }

  onChangeCPF(e) {
    const cpf = e.target.value;
    
    this.setState(prevState => ({
      currentCliente: {
        ...prevState.currentCliente,
        cpf: cpf
      }
    }));
  }

  onChangeRenda(e) {
    const renda = e.target.value;
    this.setState(prevState => ({
      currentCliente: {
        ...prevState.currentCliente,
        renda: renda
      }
    }));
  }

  onChangeTelefone(e) {
    const telefone = e.target.value;
    this.setState(prevState => ({
      currentCliente: {
        ...prevState.currentCliente,
        telefone: telefone
      }
    }));
  }

onChangeData(e){
  const data_criacao = e.target.value;
    this.setState(prevState => ({
      currentCliente: {
        ...prevState.currentCliente,
        data_criacao: data_criacao
      }
  }));
}
  
  goTelaClientes() {
    this.props.router.navigate('/clientes');
  }


  updateCliente() {
    Cliente.update(
      this.state.currentCliente.id,
      this.state.currentCliente
    )
      .then(response => {
        console.log(response.data);
        this.props.router.navigate('/clientes');
      })
      .catch(e => {
        console.log(e);
      });
  }

  deleteCliente() {
    Cliente.delete(this.state.currentCliente.id)
      .then(response => {
        console.log(response.data);
        this.props.router.navigate('/clientes');
      })
      .catch(e => {
        console.log(e);
      });
  }

  render() {
    const { currentCliente } = this.state;

    return (
      <div>
          <div className="edit-form">
            <h4>Cliente</h4>
            <form>

              <div className="form-group">
                <label htmlFor="title">Nome</label>
                <input
                  type="text"
                  className="form-control"
                  id="nome"
                  autoFocus
                  value={currentCliente.nome}
                  onChange={this.onChangeNome}
                />
              </div>

              <div className="form-group">
                <label htmlFor="description">E-mail</label>
                <input
                  type="text"
                  className="form-control"
                  id="email"
                  value={currentCliente.email}
                  onChange={this.onChangeEmail}
                />
              </div>

              <div className="form-group">
                <label htmlFor="description">CPF</label>
                <input
                  type="text"
                  className="form-control"
                  id="cpf"
                  value={currentCliente.cpf}
                  onChange={this.onChangeCPF}
                />
              </div>

              <div className="form-group">
                <label htmlFor="description">Renda</label>
                <input
                  type="text"
                  className="form-control"
                  id="renda"
                  onChange={this.onChangeRenda}
                />
              </div>

              <div className="form-group">
                <label htmlFor="description">Telefone</label>
                <input
                  type="text"
                  className="form-control"
                  id="telefone"
                  value={currentCliente.telefone}
                  onChange={this.onChangeTelefone}
                />
              </div>

              <div className="form-group">
                <label htmlFor="description">Data de Criação</label>
                <input
                  type="DateTime-Local"
                  className="form-control"
                  value={currentCliente.data_criacao}
                  onChange={this.onChangeData}
                  id="data"
                />
              </div>
            </form>

            <button
              className="badge badge-primary mr-2"
              onClick={() => this.goTelaClientes(true)}>
                Clientes
            </button>

            <button
              className="badge badge-danger mr-2"
              onClick={this.deleteCliente}
            >
              Apaga
            </button>

            <button
              type="submit"
              className="badge badge-success"
              onClick={this.updateCliente}
            >
              Atualiza
            </button>
            <p>{this.state.message}</p>
          </div>
      </div>
    );
  }
}

export default withRouter(ClienteTela);