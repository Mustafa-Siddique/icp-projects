import Int "mo:base/Int";
actor Calculator {
  var cell : Int = 0;
  
  // Add
  public func add (x : Int) : async Int {
    cell += x;
    return cell;
  };

  // Subtract
  public func sub (x: Int) : async Int {
    cell -= x;
    return cell;
  };

  // Multiply
  public func mul (x: Int) : async Int {
    cell *= x;
    return cell;
  };

  // Division
  public func div (x: Int) :async ?Int {
    if (x == 0) {
      return null;
    } else {
      cell /= x;
      return ?cell;
    }
  };

  // Clear
  public func clearAll() : async () {
    cell := 0;
  };

};
