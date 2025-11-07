// === Subshop Script Operator ===
// Name: FingerprintRandomizer
// Description: Randomly sets "client-fingerprint" for each proxy and disables skip-cert-verify
// Requires: Backend version > 2.14.88

// Single server mode
const fingerprints = ["firefox", "safari", "ios", "edge", "random"];
$server["client-fingerprint"] = fingerprints[Math.floor(Math.random() * fingerprints.length)];
$server["skip-cert-verify"] = false;

// Multiple proxy mode
function operator(proxies, targetPlatform, context) {
  const fingerprints = ["firefox", "safari", "ios", "edge", "random"];
  return proxies.map(p => {
    p["client-fingerprint"] = fingerprints[Math.floor(Math.random() * fingerprints.length)];
    p["skip-cert-verify"] = false;
    return p;
  });
}
