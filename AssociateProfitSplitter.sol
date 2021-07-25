pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
   
    
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;
    
    /*
    * This is the constructor with 3 parameters
    * all are of type address payable
    
    */
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    /*
    * This function returns the current balance
    */
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        
        //The amount is split equally into 3 and give to each employee
        uint amount = msg.value/3;

       

        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);
        
        
        //return back the balance amount
        
        msg.sender.transfer(msg.value-amount*3);
        
    }
    
    /*
    * Deposit() function is called from here
    * This will ensure that the logic in deposit executes if Ether is sent directly to the contract. 
    * This is important to prevent Ether from being locked in the contract since we don't have a withdraw function in this use-case.
    */

    function() external payable {
        
        
        deposit();
    }
}