actor Counter {

  stable var counter = 0;

  // Get the current value of the counter
  public query func getCount() : async Nat {
    return counter;
  };

  // Set the value of the counter
  public func setCount(newCount : Nat) : async () {
    counter := newCount;
  };

  // Increment the counter
  public func increment() : async () {
    counter += 1;
  };

};
