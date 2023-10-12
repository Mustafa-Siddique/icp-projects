import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300;
  // currentValue := 100;
  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  let id = 7657589698;

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Insufficient balance");
    };
  };

  public func compound() {
    var currentTime = Time.now();
    var elapsedTimeNS = currentTime - startTime;
    var elapsedTimeS = elapsedTimeNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(elapsedTimeS));
    startTime := currentTime;
  };

  public query func checkBalance(): async Float {
    return currentValue;
  }
};
