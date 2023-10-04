import Principal "mo:base/Principal";

shared (install) actor class WhoAmI(someone: Principal) = this {
  // Bind the optional `this` argument

  // Return the principal identifier of this canister that installed this canister
  public query func installer() : async Principal {
    return install.caller;
  };

  // Return the principal identifier of the wallet canister that installed this canister
  public query func argument() : async Principal {
    return someone;
  };

  // Return the principal identifier of the caller of this method
  public shared (message) func whoami() : async Principal {
    return message.caller;
  };

  // Return the principal identifier of this canister
  public func id() : async Principal {
    return await whoami();
  };

  // Return the principal identifier of this canister via the optional `this` binding. Quicker than prev method
  public func idQuick() : async Principal {
    return Principal.fromActor(this);
  };
}