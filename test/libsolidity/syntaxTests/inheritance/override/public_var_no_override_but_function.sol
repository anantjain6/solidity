contract A {
	function foo() internal virtual pure returns(uint) { return 5; }
}
contract X is A {
	uint public foo;
}
// ----
// TypeError: (100-115): Base function must be external when overridden by public state variable.
