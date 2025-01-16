import Debug "mo:base/Debug";

actor DBank{
  stable var currentValue: Nat = 300;
  // currentValue := 100;

  let id = 234567894;

  Debug.print(debug_show(id));

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount : Nat) {
    let temp: Int = currentValue - amount;
    if ( temp >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Amount too large, currentValue less than zero.");
    }
  };

  public query func checkBalance(): async Nat {
    return currentValue;
  };
}