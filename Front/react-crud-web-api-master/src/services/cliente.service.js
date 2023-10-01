//import http from "../http-common";
import axios from 'axios';
//import authHeader from './auth-header';

const API_URL = 'http://localhost:8080/api';

class ClienteDataService {
  getAll() {
    const token = {'Authorization':"Bearer " + JSON.parse(localStorage.getItem('user')).accessToken}
    return axios.get(API_URL + "/clientes", {headers: `${token}`});
  }

  get(id) {
    const token = {'Authorization':"Bearer " + JSON.parse(localStorage.getItem('user')).accessToken}
    return axios.get(API_URL + `/clientes/${id}`, { headers: `${token}`});
  }

  create(data) {
    const token = {'Authorization':"Bearer " + JSON.parse(localStorage.getItem('user')).accessToken}
    return axios.post(API_URL + "/clientes", data, { headers: `${token}`});
  }

  update(id, data) {
    const token = {'Authorization':"Bearer " + JSON.parse(localStorage.getItem('user')).accessToken}
    return axios.put(API_URL + `/clientes/${id}`, data, { headers: `${token}`});
  }

  delete(id) {
    const token = {'Authorization':"Bearer " + JSON.parse(localStorage.getItem('user')).accessToken}
    return axios.delete(API_URL + `/clientes/${id}`, { headers: `${token}`});
  }

  deleteAll() {
    const token = {'Authorization':"Bearer " + JSON.parse(localStorage.getItem('user')).accessToken}
    return axios.delete(API_URL + `/clientes`, { headers: `${token}`});
  }
}
// eslint-disable-next-line
export default new ClienteDataService();
