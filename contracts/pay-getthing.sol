pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";
//import "_Owner.sol";

contract Paygetthing {
     uint public count=0;
    struct Filegroup{
      string filename;
      string filehash;
      string price;
    }
    Filegroup[] public filegroups;
    Filegroup public newfile;
     constructor() {
       setNewfile("test","hash","0.01");
     // setNewfile("test1","hash1",0.001);
    }
   // Filegroup[] private  filegroups;
    uint payUpFee = 0.001 ether;
    function setpayUpFee(uint _fee) public {
        payUpFee = _fee;
        console.log(payUpFee);
    }
    modifier Payfee() {
    require(msg.value  >= payUpFee);
    _;
  }

   function setNewfile(string memory _filename ,string memory _filehash, string memory _price) public {
       count++;
       filegroups[count]=Filegroup(_filename,_filehash,_price);
       // filegroups.push(Filegroup(_filename,_filehash,_price));
        //console.log(filegroups[0].filehash);
    } 



    function buyThing() public payable Payfee{
      require(msg.value == payUpFee);
      console.log(filegroups[count].filehash);
    //do anything
  } 
    
}