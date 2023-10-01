import React, { Component } from "react";
import { Routes, Route, Link } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import "./App.css";

import Login from "./components/login";
import AddCliente from "./components/add-cliente.component";
import ClientesList from "./components/clientes-list.component";
import Clientes from "./components/cliente.component";

class App extends Component {
  render() {
    return (
      <div>
        <nav className="navbar navbar-expand navbar-dark bg-success">
          <Link to={"/"} className="navbar-brand">
            <img src="../../logo_pefoce.svg" alt="PEFOCE" width="100%"></img>
          </Link>
          <div className="navbar-nav mr-auto">
            <li className="nav-item">
              <div id="tagLinkTutorials"></div>
            </li>
            <li className="nav-item">
              <div id="tagLinkAdd"></div>
            </li>
          </div>
        </nav>

        <div className="container mt-3">
          <Routes>
            <Route path="/" element={<Login/>} />
            <Route path="/clientes" element={<ClientesList/>} />
            <Route path="/add" element={<AddCliente/>} />
            <Route path="/clientes/:id" element={<Clientes/>} />
          </Routes>
        </div>
      </div>
    );
  }
}

export default App;
