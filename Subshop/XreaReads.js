<!--nobanner-->
<script type="text/javascript">
(function() {
    // ▼▼▼▼
    var adSrc = "https://cache1.value-domain.com/xa.j?site=xxxxx.s331.xrea.com";
    // ▲▲▲▲

    var lang = (navigator.language || navigator.userLanguage || "en").toLowerCase();

    if (lang.indexOf('zh') === -1) {
        var containerId = "my-custom-ad-box";
      
        document.write('<style>');
        document.write('#' + containerId + ' { position: fixed; bottom: 0; left: 0; z-index: 99; background: transparent; }');
        document.write('</style>');

        document.write('<div id="' + containerId + '">');
        document.write('<script type="text/javascript" src="' + adSrc + '"><\/script>');
        document.write('</div>');

        setTimeout(function() {
            var box = document.getElementById(containerId);
            if (box) {
                box.style.display = 'none';
                // box.remove();
            }
        }, 7000);
    }
})();
</script>
