// SPDX-License-Identifier: MIT
//version de solidity
pragma solidity ^0.8.11;

//interface
interface IERC20 {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address  to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed oener, address indexed spender, uint256 value);

}

contract ERC20 is IERC20 {

    mapping(address => uint256) private _balance;
    mapping(address => mapping(address => uint256)) private _allowances;

    //variables
    uint256 private _totalSupply;
    string _name;
    string _symbol;

    //constructor inicailizar 
    constructor(string memory name_, string memory symbol_){
        _name = name_;
        _symbol = symbol_;        
    }

    function name() public view virtual returns (string memory){
        return _name;
    }

    function symbol() public view virtual returns (string memory){
        return _symbol;
    }

    function decimals() public view virtual returns (uint256){
        return 18;
    }

    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

     function balanceOf(address account) public view virtual override returns (uint256) {
        return _balance[account];
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = msg.sender;
        _transfer(owner, to, amount);
        return true;
    }

    function allowance(address owner, address spender)  public view virtual override returns (uint256) {
       return _allowances[owner][spender]; 
    }

    function approve(address spender, uint256 amount ) public virtual override returns (bool){
        address owner = msg.sender;
        _approve(owner, spender, amount);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override returns (bool) {
        address spender = msg.sender;
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool){
        address owner = msg.sender;
        _approve(owner, spender, _allowances[owner][spender] + addedValue);
        return true;
    }

    function deceaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool){
        address owner = msg.sender;
        uint256 currentAllowance =  _allowances[owner][spender];
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance  below zero");
        unchecked {
            _approve(owner, spender, currentAllowance - subtractedValue);
        }

        return true;
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) public virtual {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        _befereTokenTransfer(from, to, amount);
        uint256 fromBalance = _balance[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balance[from] = fromBalance - amount;
        }
        _balance[to] = amount;
        emit Transfer(from, to, amount);
        _afterTokenTransfer(from, to, amount);
    }
    // crear tokens
    function _mint(address account, uint256 amount) internal  virtual {
        require(account != address(0), "ERC20: mint to the zero address");
        _befereTokenTransfer(address(0), account, amount);
        _totalSupply += amount;
        _balance[account] += amount;
        emit Transfer(address(0), account, amount);
        _afterTokenTransfer(address(0), account, amount);  

    }
    // distruier tokens 
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");
        _befereTokenTransfer(account, address(0), amount);
        uint256 accountBalance = _balance[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        unchecked {
            _balance[account] = accountBalance - amount;
        }
        
        _totalSupply -= amount;
        emit Transfer(account, address(0), amount);
        _afterTokenTransfer(account, address(0), amount);

    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);

    }

    function _spendAllowance(
       address owner,
       address spender,
       uint256 amount
    ) internal virtual {
         uint256 currentAllowance = allowance(owner, spender);
        if(currentAllowance != type(uint256).max){
            require(currentAllowance >= amount, "ERC20: insufficent allowance");
            unchecked {
                _approve(owner, spender, amount);
            }
        }
    }

    function _befereTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}


}
// < y >