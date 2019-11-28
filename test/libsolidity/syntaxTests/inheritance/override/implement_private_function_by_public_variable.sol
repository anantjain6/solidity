abstract contract X { function test() private virtual returns (uint256); }
contract Y is X {
    uint256 public override test = 42;
}
contract T {
    constructor() public { new Y(); }
}
// ----
// TypeError: (97-130): Base function must be external when overridden by public state variable.
// TypeError: (97-130): Overriding public state variable visibility differs.
// TypeError: (22-72): "virtual" and "private" cannot be used together.
