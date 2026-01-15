function operator(proxies) {

  /* ===== 可修改环境变量（留空 = 保持原样） ===== */

  const NAME_PREFIX = "";        // 名称前缀，如 "A-"
  const NAME_START = "1";        // 起始序号，默认 1
  const SKIP_VERIFY = "false";   // "true" 跳过证书验证
  const FINGERPRINTS = "";       // "edge" / "firefox,ios"，留空则默认随机

  const start = NAME_START ? parseInt(NAME_START, 10) : 1;
  const skip = SKIP_VERIFY === "true";

  const fps = FINGERPRINTS
    ? FINGERPRINTS.split(",").map(v => v.trim()).filter(Boolean)
    : ["firefox", "safari", "ios", "edge", "random"];

  return proxies.map((p, i) => {

    if (NAME_PREFIX) {
      p.name = `${NAME_PREFIX}${start + i}`;
    }

    if (SKIP_VERIFY !== "") {
      p["skip-cert-verify"] = skip;
    }

    p["client-fingerprint"] =
      fps[Math.floor(Math.random() * fps.length)];

    return p;
  });
}
