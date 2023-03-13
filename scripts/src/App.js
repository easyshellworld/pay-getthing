
import './App.css';
import Web3 from "web3";
import { useEffect, useState } from "react";

function App() {
  const [account, setAccount] = useState(); // 设置账号的状态变量
  useEffect(() => {
    async function load() {
        const web3 = new Web3(
            Web3.givenProvider || "http://localhost:7545"
        );
        const accounts = await web3.eth.requestAccounts();

        setAccount(accounts[0]);
    }

    load();
}, []);
  return (
    <div className="App">
      <div>当前账号： {account}</div>;
      filename: <input type="text" name="filename"/><br/>
      filehash: <input type="text" name="filehash"/><br/>
      fileprice: <input type="text" name="price"/>
    </div>
  );
}

export default App;
