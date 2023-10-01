//import axios from "axios";
//const API_URL = process.env.REACT_APP_API_URL;

export default function authHeader() {
  const user = 'Bearer ' + JSON.parse(localStorage.getItem('user')).accessToken;
  console.log(user);
  
  if (user && user.accessToken) {
    return { 'Authorization': user };
  } else {
    return {};
  }
  
  //const body = {}

}