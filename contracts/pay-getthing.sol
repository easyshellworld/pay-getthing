pragma solidity >=0.8.2 <0.9.0;

//import "hardhat/console.sol";

      

contract Paygetthing {
  
     address payable public owner;
     event PaymentReceived(address sender, uint256 amount);
     event givething(string filehash);
    struct Filegroup{
      string filename;
      //string filehash;
      uint price;
    }
    Filegroup[] public filegroups;
    string[]  private fileshash;
     constructor() {  
       owner = payable(msg.sender);  
       setNewfile("file1","hash1",1);
    }
 
 

    //string memory _filehash, string memory _price
   function setNewfile(string memory _filename,string memory _filehash, uint _price) public {

       filegroups.push(Filegroup(_filename,_price));
       fileshash.push(_filehash);

       // filegroups.push(Filegroup(_filename,_filehash,_price));
        //console.log(filegroups[0].filehash);
    } 



    function buyThing(uint _id) public payable {
      require(msg.value >= filegroups[_id].price , "Insufficient payment");
      emit PaymentReceived(msg.sender, msg.value);
       payable(msg.sender).transfer(msg.value); 
       //string memory res=fileshash[_id];
      emit givething(fileshash[_id]); 
     // console.log(filegroups[_id].filename);
    //  console.log(fileshash[_id]);
     
    //do anything

  } 
   

/*   function getfilename() public view returns (Filegroup[]) {

     return  filegroups;
  }  */

       function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        payable(msg.sender).transfer(address(this).balance);
    }
    
}