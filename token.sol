pragma solidity 0.8.26;

contract MyToken {

    string public name = "MyToken";          
    string public symbol = "MTK";            
    uint256 public totalSupply = 0;          

    mapping(address => uint256) public balances;

    event Mint(address indexed to, uint256 amount);

    event Burn(address indexed from, uint256 amount);

    function mint(address to, uint256 amount) public {
       
        totalSupply += amount;
      
        balances[to] += amount;
      
        emit Mint(to, amount);
    }

    function burn(address from, uint256 amount) public {
        require(balances[from] >= amount, "Insufficient balance to burn");

        totalSupply -= amount;
       
        balances[from] -= amount;
     
        emit Burn(from, amount);}
}
