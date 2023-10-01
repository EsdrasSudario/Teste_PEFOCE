import axios from 'axios';
//import authHeader from './auth-header';

const API_URL = 'http://localhost:8080/api/';
const token = {'Authorization':"Bearer " + JSON.parse(localStorage.getItem('user')).accessToken}

class UserService {
  getPublicContent() {
    return axios.get(API_URL + 'clientes');
  }

  getUserBoard() {
    return axios.get(API_URL + 'user', {headers: `${token}`});
  }

  getModeratorBoard() {
    return axios.get(API_URL + 'mod', {headers: `${token}`});
  }

  getAdminBoard() {
    return axios.get(API_URL + 'admin', {headers: `${token}`});
  }
}
// eslint-disable-next-line
export default new UserService();
