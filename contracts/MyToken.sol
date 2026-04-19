// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyToken {

    
    
    string public name     = "MyToken";
    string public symbol   = "MTK";
    uint8  public decimals = 18;
    uint256 public totalSupply;
    address public owner;



    
    mapping(address => uint256) public balanceOf;
    
    
    mapping(address => mapping(address => uint256)) public allowance;

    

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);


    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    

    constructor(uint256 initialSupply) {
        owner = msg.sender;
        totalSupply = initialSupply * 10 ** decimals;
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    

    function transfer(address to, uint256 amount) 
        public returns (bool) 
    {
        require(to != address(0),             "Zero address");
        require(balanceOf[msg.sender] >= amount, "Not enough balance");

        balanceOf[msg.sender] -= amount;
        balanceOf[to]         += amount;

        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function approve(address spender, uint256 amount) 
        public returns (bool) 
    {
        require(spender != address(0), "Zero address");

        allowance[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount)
        public returns (bool)
    {
        require(to != address(0),              "Zero address");
        require(balanceOf[from] >= amount,     "Not enough balance");
        require(allowance[from][msg.sender] >= amount, "Not enough allowance");

        allowance[from][msg.sender] -= amount;
        balanceOf[from]             -= amount;
        balanceOf[to]               += amount;

        emit Transfer(from, to, amount);
        return true;
    }

    

    function mint(address to, uint256 amount) 
        public onlyOwner 
    {
        require(to != address(0), "Zero address");

        totalSupply   += amount;
        balanceOf[to] += amount;

        emit Transfer(address(0), to, amount);
    }

    function burn(uint256 amount) public {
        require(balanceOf[msg.sender] >= amount, "Not enough balance");

        balanceOf[msg.sender] -= amount;
        totalSupply           -= amount;

        emit Transfer(msg.sender, address(0), amount);
    }

    function transferOwnership(address newOwner) 
        public onlyOwner 
    {
        require(newOwner != address(0), "Zero address");
        owner = newOwner;
    }
}
