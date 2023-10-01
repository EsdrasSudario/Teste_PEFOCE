//import http from "../http-common";
import axios from 'axios';
//import authHeader from './auth-header';

const API_URL = 'http://localhost:8080/api';
const token = {'Authorization':"Bearer " + JSON.parse(localStorage.getItem('user')).accessToken}

class ClienteDataService {
  getAll() {
    return axios.get(API_URL + "/clientes", {headers: `${token}`});
  }

  get(id) {
    return axios.get(API_URL + `/clientes/${id}`, { headers: `${token}`});
  }

  create(data) {
    return axios.post(API_URL + "/clientes", data, { headers: `${token}`});
  }

  update(id, data) {
    return axios.put(API_URL + `/clientes/${id}`, { headers: `${token}`}, data);
  }

  delete(id) {
    return axios.delete(API_URL + `/clientes/${id}`, { headers: `${token}`});
  }

  deleteAll() {
    return axios.delete(API_URL + `/clientes`, { headers: `${token}`});
  }
}
// eslint-disable-next-line
export default new ClienteDataService();
