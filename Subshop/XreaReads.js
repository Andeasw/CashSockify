<script>
  (function () {
    const langs = (navigator.languages && navigator.languages.length)
      ? navigator.languages
      : [navigator.language || ""];

    const isZh = langs.some(l => String(l).toLowerCase().startsWith("zh"));

    if (isZh) {
      document.documentElement.setAttribute("data-nobanner", "true");

      const banner = document.querySelector("#banner");
      if (banner) banner.style.display = "none";

      document.documentElement.appendChild(document.createComment("nobanner"));
    }
  })();
</script>
