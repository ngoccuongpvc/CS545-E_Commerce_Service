import React, { useRef, useState } from 'react';
import './Login.css';
import { useDispatch } from 'react-redux';
import { useNavigate, useLocation } from 'react-router-dom';
import Cookies from 'js-cookie';
import { authActions } from '../../store/index';
import { fetchService } from '../../service/fetchService';


const Login = (props) => {

  const navigate = useNavigate();
  const location = useLocation();
  const from = location.state?.from?.pathname || "/";

  const dispatch = useDispatch();
  const formData = useRef();

  const errRef = useRef();
  const [errMsg, setErrMsg] = useState('');

  const loginHandler = async (e) => {
    e.preventDefault();
    try {
      const form = formData.current
      const userCredentials = { email: form['user'].value, password: form['password'].value };
      console.log(userCredentials)
      const res = await fetchService.post('authenticate', userCredentials);
      console.log(res)
      const accessToken = res.data.accessToken;
      const refreshToken = res.data.refreshToken;
      dispatch(authActions.loginSuccessful());

      Cookies.set('accessToken', accessToken, { secure: true });
      Cookies.set('refreshToken', refreshToken, { secure: true });

      navigate(from, { replace: true });

    } catch (err) {
      if (!err?.response) {
        setErrMsg('No Server Response');
      } else if (err.response?.status === 400) {
        setErrMsg('Missing Username or Password');
      } else if (err.response?.status === 401) {
        setErrMsg('Unauthorized');
      } else {
        setErrMsg('Login Failed');
      }
      // errRef.current.focus();
    }


  };

  return (
    <main className="auth">
      <section>
        <p ref={errRef} className={errMsg ? "errmsg" : "offscreen"} aria-live="assertive">{errMsg}</p>

        <form ref={formData} onSubmit={loginHandler}>
          <div >
            <label htmlFor='user'>User</label>
            <input type='text' id='user' />
          </div>
          <div >
            <label htmlFor='password'>Password</label>
            <input type='password' id='password' />
          </div>
          <button>Login</button>
        </form>
      </section>
    </main>
  );
};

export default Login;

