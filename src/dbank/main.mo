import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentValue: Float = 300;
  stable var startTime = Time.now();
  let id = 234567894;

  Debug.print(debug_show(startTime));
  Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount : Float) {
    let temp: Float = currentValue - amount;
    if ( temp >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Amount too large, currentValue less than zero.");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsed = timeElapsedNS/1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsed));
    startTime := currentTime;
  }
}