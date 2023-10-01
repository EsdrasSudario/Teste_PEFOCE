import axios from 'axios';
//import authHeader from './auth-header';

const API_URL = 'http://localhost:8080/api/';

class UserService {
  getPublicContent() {
    return axios.get(API_URL + 'clientes');
  }

  getUserBoard() {
    const token = {'Authorization':"Bearer " + JSON.parse(localStorage.getItem('user')).accessToken}
    return axios.get(API_URL + 'user', {headers: `${token}`});
  }

  getModeratorBoard() {
    const token = {'Authorization':"Bearer " + JSON.parse(localStorage.getItem('user')).accessToken}
    return axios.get(API_URL + 'mod', {headers: `${token}`});
  }

  getAdminBoard() {
    const token = {'Authorization':"Bearer " + JSON.parse(localStorage.getItem('user')).accessToken}
    return axios.get(API_URL + 'admin', {headers: `${token}`});
  }
}
// eslint-disable-next-line
export default new UserService();
