interface I {
    function f() external;
    function g() external;
}
abstract contract A is I {
    function f() external override {}
    function g() external override virtual;
}
abstract contract B is I {
    function g() external override {}
    function f() external override virtual;
}
contract C is A, B {
}
