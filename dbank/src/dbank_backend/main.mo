import Debug "mo:base/Debug";
import Int "mo:base/Int";

actor DBank {
  stable var currentValue = 300;
  // currentValue := 100;

  let id = 7657589698;

  public func topUp(amount : Nat) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Nat) {
    let tempValue : Int = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Insufficient balance");
    };
  };

  public query func checkBalance(): async Nat {
    return currentValue;
  }
};
